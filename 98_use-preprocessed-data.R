dfo <- read_csv2("data-input/2015-2017ZMENA.csv")
dfo

dflo <- dfo %>%
  # přejmenovat sloupeček `DESTINATION` na `to`
  rename(from = DESTINATION) %>%
  # překlopit do dlouého formátu
  pivot_longer(ends_with("CHANGE"), names_to = "to") %>%
  # přejmenovat regiony (původní sloupečky), aby se jmenovaly stejně jako regiony v prvním sloupečku (bez "_CHANGE" a "_" místo mezery v názvu)
  mutate(to = str_remove(to, "_CHANGE") %>%
           str_replace("_", " ")) %>%
  # vyřadit položky, kde je stejný výchozí a cílový region
  filter(#!(from == to),
    # vyhodit záporné hodnoty
    value > 0) %>%
  # vybrat jen tři podstatné sloupce
  select(from, to, value)
dflo

dflo_filtered <- dflo %>%
  ungroup() %>%
  filter(value > 1e5) %>%
  mutate(value = value/1e5,
         # to = str_replace(to, "Europe", "čáěšžěšéí"),
         # from = str_replace(from, "Europe", "čáěšžěšéí"),
         from = str_replace(from, "South-eastern Asia", "SouthEastern Asia") %>%
           str_wrap(10),
         to = str_replace(to, "South-eastern Asia", "SouthEastern Asia") %>%
           str_wrap(10))
