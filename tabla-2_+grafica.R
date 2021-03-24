library(httr)
library(jsonlite)
library(plotly)

repositorio = GET("https://map.gob.do/api/datos_abiertos/data=emp_por_edad&format=json")

Datos = fromJSON(rawToChar(repositorio$content))

Datos <- data.frame(Datos)

grafico2 = plot_ly(
  Datos, 
  labels = ~Edad,
  values = ~Cantidad_empleados, 
  textposition = "inside",
  textinfo = "label+percent",
  type = "pie"
)
grafico2 %>% layout(
  title = "Empleado publicos por Edad en el SASP, MAP, 01-02-2021 (Porcentual)"
)

