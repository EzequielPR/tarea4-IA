library(httr)
library(jsonlite)
library(plotly)

repositorio = GET("http://www.arlss.gov.do/Generador_Documentos/Generador.aspx?format=json&report=EPDX")

Datos = fromJSON(rawToChar(repositorio$content))

Datos <- data.frame(Datos)

grafico4 = plot_ly(
  Datos,
  x = ~Diagnostico,
  y = ~Total,
 type = "bar"
)
grafico4 %>% layout(title = "Enfermedades Profesionales Por Diagnostico")

