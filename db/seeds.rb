puts " ✅"
print "Creating Setttings"

Setting.create(key: 'ayre_url', value: 'http://ayre.munimadrid.es')
Setting.create(key: 'org_name', value: 'Intervención General del Ayuntamiento de Madrid')
Setting.create(key: 'app_name', value: 'Sistema de gestión de Control Interno')


puts " ✅"
print "Creating Fix SapCodes: "
print "ZTIPO_INTERV"

SapCode.create!(field: 'ZTIPO_INTERV', code: 'E', description: 'Exento de Fiscalización previa', updated_by: 'SEEDS' )
SapCode.create!(field: 'ZTIPO_INTERV', code: 'S', description: 'Sujeto a Fiscalización previa', updated_by: 'SEEDS' )

puts " ✅"
print "Creating Fix SapCodes: "
print "CODMOD"

SapCode.create!(field: 'CODMOD', code: 'R', description: 'Retención de crédito', updated_by: 'SEEDS' )
SapCode.create!(field: 'CODMOD', code: 'RCOM', description: 'Retención de crédito Complementaria', updated_by: 'SEEDS' )
SapCode.create!(field: 'CODMOD', code: 'A', description: 'Autorización', updated_by: 'SEEDS' )
SapCode.create!(field: 'CODMOD', code: 'ACOM', description: 'Autorización de crédito Complementaria', updated_by: 'SEEDS' )
SapCode.create!(field: 'CODMOD', code: 'AD', description: 'Autorización y Disposición de crédito', updated_by: 'SEEDS' )
SapCode.create!(field: 'CODMOD', code: 'ADCOM', description: 'Autorización y Disposición de crédito Complementaria', updated_by: 'SEEDS' )
SapCode.create!(field: 'CODMOD', code: 'ADD', description: 'Autorización, Disposición y Obligación', updated_by: 'SEEDS' )
SapCode.create!(field: 'CODMOD', code: 'ADOCOM', description: 'Autorización, Disposición y Obligación Complementaria', updated_by: 'SEEDS' )
SapCode.create!(field: 'CODMOD', code: 'ADCON', description: 'AD Conjunto', updated_by: 'SEEDS' )
SapCode.create!(field: 'CODMOD', code: 'ADOJ', description: 'ADO Pagos a justificar', updated_by: 'SEEDS' )
SapCode.create!(field: 'CODMOD', code: 'ACF', description: 'Reposición/Cancelación de Fondos ACF', updated_by: 'SEEDS' )

puts " ✅"
print "Creating Fix SapCodes: "
print "TRAMITE"

SapCode.create!(field: 'TRAMITE', code: 'GESTOR', description: 'Órgano Gestor', updated_by: 'SEEDS' )
SapCode.create!(field: 'TRAMITE', code: 'INTERVENCION', description: 'Intervención', updated_by: 'SEEDS' )
SapCode.create!(field: 'TRAMITE', code: 'APROBACION', description: 'Órgano de Aprobación', updated_by: 'SEEDS' )
SapCode.create!(field: 'TRAMITE', code: 'CONTABLE', description: 'Contabilidad', updated_by: 'SEEDS' )
SapCode.create!(field: 'TRAMITE', code: 'FINALIZADO', description: 'Expediente Contabilizado', updated_by: 'SEEDS' )
SapCode.create!(field: 'TRAMITE', code: 'ANULADO', description: 'Expediente anulado', updated_by: 'SEEDS' )

puts " ✅"
print "Creating Fix SapCodes: "
print "NATURALEZA"

SapCode.create!(field: 'NATURALEZA', code: 'ANUAL', description: 'Gasto del ejercicio', updated_by: 'SEEDS' )
SapCode.create!(field: 'NATURALEZA', code: 'PLURIANUAL', description: 'Gasto de varios ejercicios', updated_by: 'SEEDS' )
SapCode.create!(field: 'NATURALEZA', code: 'ANTICIPADA', description: 'Gasto de ejercicios futuros', updated_by: 'SEEDS' )
