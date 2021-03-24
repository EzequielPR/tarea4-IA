library(httr)
library(jsonlite)
library(plotly)

repositorio = GET("http://www.arlss.gov.do/Generador_Documentos/Generador.aspx?format=json&report=EPDX")

Datos = fromJSON(rawToChar(repositorio$content))

Datos <- data.frame(Datos)

# grafico4 = plot_ly(
#   Datos, 
#   y = ~Diagnostico,
#   x = ~Total, 
#  type = "bar"
# )
# grafico4 %>% layout(title = "Enfermedades Profesionales Por Diagnostico")

