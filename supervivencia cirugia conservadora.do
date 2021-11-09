*** Análisis de supervivencia ***
     ** Stata 15, nov 2021 **

	** Supervivencia global **
stset T1m, id(record_id) failure( MUERE ) time0(T0) exit(time .) origin(time T0) scale(365.25)

** Estimar tasas de recurrencia local 
stset T1rlocal, id(record_id) failure(tipo_de_la_recaida ==1) time0(T0) exit(time .) origin(time T0) scale(365.25)

** Estimar tasa de recurrencia regional
stset T1rregional, id(record_id) failure(tipo_de_la_recaida ==2) time0(T0) exit(time .) origin(time T0) scale(365.25)

** Estimar tasa de recurrencia a distancia
stset T1rdistncia, id(record_id) failure(tipo_de_la_recaida ==3) time0(T0) exit(time .) origin(time T0) scale(365.25)

** Estimar tasa de recurrencia (cualquier tipo)
stset T1r, id(record_id) failure(RECAE) time0(T0) exit(time .) origin(time T0) scale(365.25)
