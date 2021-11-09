*** AListamiento base de datos para análisis de supervivencia ***
                     ** Stata 15, nov 2021 **
					 
use "D:\Mega\Desenlaces cirugía conservadora\cirugiaconservadora.dta"

gen T0 = fec_consul_bidisciplinaria
gen sm = fecha_de_la_mortalidad
replace sm = fec_ult_cont_reg_hist_clic if sm == .
format T0 %td
gen muerto = 1 if fecha_de_la_mortalidad != .
replace muerto = 0 if muerto == .
format sm %td
gen sr = fecha_de_recaida
move sr fecha_de_recaida
format sr %td
replace sr = fec_ult_cont_reg_hist_clic if sr== .
rename sm T1m
rename sr T1r


gen sr = fec_ult_cont_reg_hist_clic
replace sr = fecha_de_recaida if tipo_de_la_recaida == 1
gen T1rlocal = sr
drop sr
gen sr = fec_ult_cont_reg_hist_clic
replace sr = fecha_de_recaida if tipo_de_la_recaida == 2
gen T1rregional = sr
drop sr
gen sr = fec_ult_cont_reg_hist_clic
replace sr = fecha_de_recaida if tipo_de_la_recaida == 3
gen T1rdistncia = sr
drop sr
tab T1rdistncia
format T1rdistncia %td
format T1rregional %td
format T1rlocal %td
save "D:\Mega\Desenlaces cirugía conservadora\cirugiaconservadora.dta", replace
