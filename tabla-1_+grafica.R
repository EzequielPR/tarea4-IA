library(httr)
library(jsonlite)
library(plotly)

repositorio = GET("https://map.gob.do/api/datos_abiertos/data=emp_por_edad&format=json")

Datos = fromJSON(rawToChar(repositorio$content))

Datos <- data.frame(Datos)

grafico1 = plot_ly(
  Datos, 
  x = ~Edad,
  y = ~Cantidad_empleados, 
  type = "bar",
  xaxis = "category"
)
grafico1 %>% layout(
  title = "Empleado publicos por Edad en el SASP, MAP, 01-02-2021",
  xaxis = list(title = "Rango de edad", type="category"),
  yaxis = list(title = "Cantidad de empleados")
)

