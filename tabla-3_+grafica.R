library(httr)
library(jsonlite)
library(plotly)

repositorio = GET("https://map.gob.do/api/datos_abiertos/data=emp_por_institucion&format=json")

Datos = fromJSON(rawToChar(repositorio$content))

Datos <- data.frame(Datos)

Datos <- Datos[order(Datos$Cantidad_empleados)]

Datos$Institucion <- factor(
  Datos$Institucion, 
  levels = unique(Datos$Institucion)
           [order(Datos$Cantidad_empleados)]
)

grafico3 = plot_ly(
  Datos,
  labels = ~Institucion,
  values = ~Cantidad_empleados,
  type = "pie"
)

grafico3 %>% layout(
  title = "Empleado publicos por Institucion en el SASP, MAP, 01-02-2021",
  xaxis = list(title = "Institucion", type="category"),
  yaxis = list(title = "Cantidad de empleados")
)

