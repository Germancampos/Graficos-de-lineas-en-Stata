
*************************************************
*** GRAFICOS ESTÉTICOS EN STATA
*** AUTOR: GERMÁN AUGUSTO CAMPOS ORTÍZ
*************************


///////////////// BASES DE DATOS DE INFLACIÓN

use "D:\Usuario\Desktop\Clases Stata Camila\inflacion.dta", clear

*Creamos variable temporal 
gen fecha_stata = tm(1999m1) +_n -1
format %tm fecha_stata
*Le decimos a Stata que "mes" es nuestra variable tiempo
tsset fecha_stata

*Gráfico normal de la inflación
twoway (tsline inflacion) (tsline tasa)

//// NOMBRES DE EJES Y LEYENDAS

*Si queremos agregar nombres de los ejes y de las leyendas. Hay dos formas. La primera es etiquetando las variables tanto de leyenda como de los ejes. Por ejemplo_ 

label variable fecha_stata "Fecha"
label variable inflacion "Tasa de inflación"
label variable tasa "Tasa de interés"

twoway (tsline inflacion) (tsline tasa)

*Me cambió el nombre del eje x, y de las leyendas, pero no del eje "y", porque el eje "y" no es una variable en nuestro caso. En este tipo de escenarios puede ser mejor recurrir al segundo método.

*La segunda forma es haciendolo manual, con xtitle, ytitle y legend. Iniciemos modificando el titulo de los ejes. 
twoway (tsline inflacion) (tsline tasa), xtitle("Fecha") ytitle("Porcentaje (%)")

*Quizá el titulo de "Fecha" no sea necesario, entonces solo le ponemos "" en xtitle()
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)")

*El tamaño de la letra de los ejes se puede modificar con size(*). El default siempre es size(*1)
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)", size(*1.5))

*Vamos a suponer que no tenemos etiquetas, o no queremos ponerselas. Aunque es lo más práctico, a veces no lo hacemos, pero vamos a suponer que no tenemos etiquetas, para así poder crear el código para incluir las leyendas. 
*Quitamos las etiquetas
label variable inflacion ""
label variable tasa ""
*Volvemos a correr el gráfico
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)")
*Ahora, la segunda opción para cambiar los nombres de las leyendas es con legen(order())
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés"))

*La posición de la leyenda se puede cambiar, con legend(position()). El número al interior de position() denotará a donde queremos poner la leyenda
*En el centro y al interior del gráfico
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(0))
*Arriba a la derecha
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(1))
*Arriba y centrado.
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(-1))
*El unico negativo que permite es el -1, cualquier otro negativo dará el mismo resultado que -1. 
*A la derecha y arriba
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(2))
*A la derecha y en el centro
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(3))
*A la derecha y abajo
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(4))
*Abajo y a la derecha
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(5))
*Abajo y en el centro (por default)
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6))

*El tamaño de la leyenda se puede modificar con size(*) Por default siempre es size(*1)
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6) size(*1.5))


///// TÍTULO, SUBTITULO Y NOTA AL PIE

*Como recorderis, el titulo se pone con title(), el subtitulo con (subtitle)
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021")

*El titulo tambien puede cambiar de posición con position() al interior de title, pero usando una coma. También se referencias números para el cambio. Los números referencian las mismas posiciones que en el caso de la leyenda. Por ejemplo:
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(6))

*Podemos dejar el 12 o el -1 para que sea por default, o simplemente lo quitamos y se toma el default
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12))

*Recordemos que el tamaño de cualquier cosa en Stata se puede modificar con size(*)
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*0.8))

*Agregamos subtítulo
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención", position(12) size(*1.2)) subtitle("Colombia 1999-2021", size(*1.2))


*Y una nota al pie se pone como note()
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1))


////////////////// CAMBIAR LA ORIENTACIÓN DE LOS EJES

**En general todo lo que se quiera hacer se puede consultar en el help. En nuestro caso help twoway. 

*Podemos cambiar la orientación de los ejes con ylabel()

*Tenemos este gráfico estándar
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1))

*Supongamos que el eje "y" no nos gusta que los números estén en vertical, entonces lo podemos colocar en horizontal. Lo hacemos con ylabel(, angle(0)). Angulo 0 significa horizontal
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) ylabel(, angle(0))

*Igual se puede hacer con el eje x. Supongamos que lo queremos vertical
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) ylabel(, angle(0)) xlabel(, angle(90))

*Todo va a depender de lo que queramos graficar

twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) ylabel(, angle(0)) xlabel(, angle(45))


////////////////// INCLUIR LINEAS EN EL GRÁFICO PARA SEÑALAR PERIODOS DE TIEMPO

*Lo hacemos con xline 
*Volvemos a nuestro gráfico estándar
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1))

*Suponemos que queremos incluir dos lineas, para señalar el periodo de tiempo de la crisis. 
*Lo primero que debemos hacer es averiguar el número correspondiente al periodo. Cada sistema de fechas de Stata está reflejado mediante un número. Para esto regresamos a nuestra variable temporal 
*Podemos recurrir a la forma larga quitandole el tsset y el format. Pero hay algo más sencillo, y es generar una nueva variable que sea una string de nuestra variable tiempo. 
*Generamos una nueva variable con nombre prueba
tostring fecha_stata, gen(prueba)
*Vamos a la base y observamos los números 
br
*Observamos qué numero corresponde cada periodo de tiempo
*Supongamos que queremos referenciar la crisis inmobiliria. Y queremos señalar desde enero del 2008 hasta enero de 2010
*Serían los números 576 (enero de 2008) y 600 (enero de 2010)

twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600)

*Como podemos ver, el default de stata son lineas rojas gruesas. Esto se puede cambiar. lcolor() para el color y lpattern() para la forma de las lineas. Por ejemplo: 
*Cambiamos el color
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black))
*Cambiamos la forma 
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*El lcolor puede ser cualquier color (ver imagen adjunta de nombre "color stata") y el lpattern puede ser: dash, dot, dash_dot, shortdash, longdash, shortdash_dot, etc. Véase pdf adjunto de nombre "StataCheatSheets_v17_4 Plotting in Stata"
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dot))

**Puedes poner más lineas si quieres, por ejemplo queremos agregar otro periodo, entonces agregamos otro xline: 
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash)) xline(661 695,  lcolor(black) lpattern(dash))


///////// CAMBIAR FORMA DE LAS SERIES 

*Volvemos al gráfico estándar que hemos ido construyendo
twoway (tsline inflacion) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Podemos cambiar el tamaño de las lineas de las series de tiempo con lwidth() al interior de cada tsline. Porque se puede cambiar para cada serie. Cada serie es un distinto tsline()
*Los nombres al interior de lwidth varian de acuerdo al tamaño, pueden ser: thin, medthin, medium, medthick, thick, vtchick, entre otras. Para más formas ir al pdf adjunto de nombre "StataCheatSheets_v17_4 Plotting in Stata":

*Vamos a cambiar solo la serie de inflación a tamaño thick
twoway (tsline inflacion, lwidth(thick)) (tsline tasa), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Ahora lo hacemos para las dos, ¿se ve mejor?
twoway (tsline inflacion, lwidth(thick)) (tsline tasa, lwidth(thick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Ahora supongamos que queremos otro color porque no nos gusta el actual, agregamos lcolor(). Algo interesante: la letra inicial l significa line. Por eso las opcioens de lineas son lwidth, lcolor, lpattern, entre otras que veremos más adelante
*Cambiemos el color. Le ponemos azul a la inflación y verde a la tasa de interes
twoway (tsline inflacion, lwidth(thick) lcolor(blue)) (tsline tasa, lwidth(thick) lcolor(green)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Recordemos que Stata tiene muchos colores, para más colores ir a imagen adjunta "color stata"
*Otros colores
twoway (tsline inflacion, lwidth(thick) lcolor(orange)) (tsline tasa, lwidth(thick) lcolor(pink)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Ahora vamos a querer cambiar el formato de lineas, y que las lineas no sean constantes. Es la misma opción de lpattern() que usamos para las líneas verticales en el gráfico. Por ejemplo:
twoway (tsline inflacion, lwidth(thick) lcolor(orange)) (tsline tasa, lwidth(thick) lcolor(pink) lpattern(dash)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Regresemos a nuestro grafico estándar
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Actualmente tenemos las series como líneas, pero puede que no la queramos así. Queremos incluir algun tipo de simbolo para diferenciarla. Entonces incluimos recast(connected) que nos va a permitir unir los simbolos, y msymbol() que nos va a permitir seleccionar el simbolo deseado. Todo adentro del tsline, porque se puede hacer para cada linea 

*Incluimos simbolos de circulos en la serie de inflación 
twoway (tsline inflacion, lwidth(medthick) recast(connected) msymbol(o)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Quizá en este tipo de grafico no nos conviene porque tenemos una serie mensual de muchos intervalos. Entonces sería mejor para una seríe anual.
*Pero podemos cambiar el tamaño de los simbolos con msize(). El tamaño por defecto es medium, pero puede ser medsmall, small, large, vlarge, huge, entre otras. Ver pdf adjunto. 
twoway (tsline inflacion, lwidth(medthick) recast(connected) msymbol(o) msize(large)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*En lugar del circulo se puede cambiar el simbolo modificando msymbol(). O: circulos grandes, o: circulos pequeños, Oh: circulos grandes pero sin relleno, oh: circulos pequeños pero sin relleno. d: rombo, t: triangulo, s: cuadrado, entre otras 
twoway (tsline inflacion, lwidth(medthick) recast(connected) msymbol(oh) msize(large)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

twoway (tsline inflacion, lwidth(medthick) recast(connected) msymbol(d) msize(large)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

twoway (tsline inflacion, lwidth(medthick) recast(connected) msymbol(s) msize(large)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))


*****Una grafica anual tiene mas sentido el uso de simbolos
***
preserve
collapse (mean) tasa inflacion, by(yr)
tsset yr
twoway (tsline inflacion, lwidth(medthick) recast(connected) msymbol(t) msize(medium)) (tsline tasa, lwidth(medthick) recast(connected) msymbol(s) msize(medium)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))
restore
***

///////////////// MODIFICAR COLOR DEL GRÁFICO Y DEL ENTORNO

*Regresemos a la gráfica estandar 
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

**Supongamos que no nos gusta el fondo azul por defecto que genera Stata. Podemos cambiarlo con graphregion()
*Coloquemos un gris
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))graphregion(fcolor(gs13))
*O un café
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))graphregion(fcolor(sienna))
*O blanco
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))graphregion(fcolor(white))

*Pero podemos separar la región del gráfico (parte externa) con la región del plot (parte interna). Podemos hacerlo agregando plotregion. Por ejemplo
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))graphregion(fcolor(white)) plotregion(fcolor(gs13))
*O al revés
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))graphregion(fcolor(gs13)) plotregion(fcolor(white))

**Todo depende de los gustos pero todo se puede modificar 

////////////////////// ESTETICA ADICIONAL 

*Stata tiene conjuntos de estilos que facilitan la vida y no es necesario modificar la estética del gráfico opción por opción. Para esto debemos instalar el conjunto grstyle si no lo tienes instalado.

*Regresemos a la gráfica estandar para poder notar los cambios
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Todos los estilos se pueden ver en help grstyle set

*Primero vamos a limpiar el estilo anterior, por si llegaba a existir uno antes. 
grstyle clear
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))


*Luego podemos modificar el estilo con plain y sus opciones. Plan es una opción para modificar el plano en concreto del plot.  Plain te convierte el gráfico en solo blanco, sin necesidad de usar el graphregion
grstyle clear
grstyle init
grstyle set plain
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Grid te mantiene las lineas horizontales de fondo en cuadricula 
grstyle clear
grstyle init
grstyle set plain, grid
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Nogrid te elimina las lineas del fondo 
grstyle clear
grstyle init
grstyle set plain, nogrid
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Dotted te convierte las lineas horizontales gruesas en lineas con puntos del fondo
grstyle clear
grstyle init
grstyle set plain, dotted
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Noextend te modifica el eje de las x
grstyle clear
grstyle init
grstyle set plain, noextend
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Box te genera un cuadro alrededor del grafico. No se ve pero cuando se descarga si se verá
grstyle clear
grstyle init
grstyle set plain, box
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))


*Tambien se pueden combinar las opciones, por ejemplo, quiero dotted y grid (cuadricula con lineas de puntitos)
grstyle clear
grstyle init
grstyle set plain, dotted grid 
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))


**Mesh modifica el gráfico, eliminando las lineas de los ejes 
grstyle clear
grstyle init
grstyle set mesh 
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

**Imesh modifica el gráfico, cambiando el color al interior del plot 
grstyle clear
grstyle init
grstyle set imesh 
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))


***Tambien se puede modificar los colores mediante una gama amplia de colores
*Volvemos a un gráfico estándar 
grstyle clear
grstyle init
grstyle set plain, dotted grid
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))
*Ahora le agregamos set color y un nombre de una combinación de colores en automática. Por ejemplo:
grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set2
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set3
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*En el caso de que tengamos simbolos en las series se puede agregar grstyle set symbol para que genere colores de los simbolos por defecto. 
*Volvamos a la grafica anual 
***
preserve
collapse (mean) tasa inflacion, by(yr)
tsset yr
grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
grstyle set symbol
twoway (tsline inflacion, lwidth(medthick) recast(connected) msymbol(t) msize(medium)) (tsline tasa, lwidth(medthick) recast(connected) msymbol(s) msize(medium)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))
restore
***


**La forma de las leyendas tambien se puede modificar. A mi en lo personal no me gusta el cuadro de la leyenda, como se ve en el siguiente grafico estandar:
grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Se agrega grstyle set legend, con un número que indica el set del legend. 1 es el default
grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
grstyle set legend 1 
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*2 Es cambiar la forma de la leyenda 
grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
grstyle set legend 2
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Podemos dejar 1 por default y modificar con opciones despues de la coma. Por ejemplo, quitarle la caja  
grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
grstyle set legend 1, nobox
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
grstyle set legend 1, stacked
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
grstyle set legend 1, inside
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
grstyle set legend 1, inside nobox
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

*Se puede cambiar el tamaño de la linea que refleja la serie 
grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
grstyle set legend 1, nobox klength(large)
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))

grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
grstyle set legend 1, nobox klength(vhuge)
twoway (tsline inflacion, lwidth(medthick)) (tsline tasa, lwidth(medthick)), xtitle("") ytitle("Porcentaje (%)") legen(order(1 "Inflación" 2 "Tasa interés") position(6)) title("Inflación y tasa de intervención en Colombia 1999-2021", position(12) size(*1)) note( "Fuente: Banco de la República-Colombia", size(*1.1)) xline(576 600,  lcolor(black) lpattern(dash))



**Finalmente se puede exportar. Exportará el ultimo gráfico que se ha corrido

graph export "D:\Usuario\Desktop\Clases Stata Camila\graph1.png", replace as(png) name("Graph")



/////////////// BASE DE DATOS DE INFLACIÓN SUBYACENTE 

***Otra base con otros ejemplos 

use "D:\Usuario\Desktop\Clases Stata Camila\inflacion subyacente.dta", clear

gen mes = tm(2000m1) +_n -1
format %tm mes
tsset mes


grstyle clear
grstyle init
grstyle set plain, dotted grid
grstyle set color Set1
grstyle set symbol
grstyle set legend 1, nobox

twoway (tsline Sinalimentosprimariosservici ,  lwidth (medthick)) (tsline SinalimentosnireguladosBR ,  lwidth(medthick)) (tsline  SinalimentosBR ,  lwidth(medthick)), ytitle("Inflación") xtitle("Año") legen(order(1 "Sin alimentos primarios, servicios públicos y combustibles" 2 "Sin alimentos ni regulados" 3 "Sin alimentos") position(6) rows(3) size(*0.9)) title(Evolución de la inflación subyacente en Colombia 2000-2021, position(12) alignment(middle) size(*0.8)) note( "Fuente: Banco de la República-Colombia", size(*0.9))  xline(661 695,  lcolor(black) lpattern(dash)) xline(564 591,  lcolor(black) lpattern(dash))

graph export "D:\Usuario\Desktop\Clases Stata Camila\graph2.png", replace as(png) name("Graph")

twoway (tsline Sinalimentosprimariosservici ,  lwidth (medthick)) (tsline SinalimentosnireguladosBR ,  lwidth(medthick)) (tsline  SinalimentosBR ,  lwidth(medthick)) (tsline  inflacion ,  lwidth(medthick) lcolor(black)), ytitle("Inflación") xtitle("Año") legen(order(1 "Sin alimentos primarios, servicios públicos y combustibles" 2 "Sin alimentos ni regulados" 3 "Sin alimentos" 4 "Inflacion") position(6) rows(4) size(*0.9)) title(Evolución de la inflación subyacente en Colombia 2000-2021, position(12) alignment(middle) size(*0.8)) note( "Fuente: Banco de la República-Colombia", size(*0.9))  xline(661 695,  lcolor(black) lpattern(dash)) xline(564 591,  lcolor(black) lpattern(dash))

graph export "D:\Usuario\Desktop\Clases Stata Camila\graph3.png", replace as(png) name("Graph")





