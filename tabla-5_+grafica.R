library(httr)
library(jsonlite)
library(plotly)

repositorio = GET("https://map.gob.do/api/datos_abiertos/data=rango_salarial&format=json")

Datos = fromJSON(rawToChar(repositorio$content))

Datos <- data.frame(Datos)

grafico5 = plot_ly(
  Datos, 
  x = ~Rango..Miles.de.Pesos.,
  y = ~Cantidad_empleados, 
  type = "bar",
  xaxis = "category"
)

grafico5 %>% layout(
  title = "Empleado publicos por Rango Salarial en el SASP, MAP, 01-02-2021",
  xaxis = list(title = "Rango Salarial (en miles de pesos)", type="category"),
  yaxis = list(title = "Cantidad de empleados")
)

