
puts " ✅"
print "Creating Settings"

Setting.create(key: 'ayre_url', value: 'http://ayre.munimadrid.es')
Setting.create(key: 'org_name', value: 'Intervención General del Ayuntamiento de Madrid')
Setting.create(key: 'app_name', value: 'Sistema de gestión de Control Interno')

# SAP codes
Setting.create(key: 'sapcode.orgapro', value: 'consulta_organo_aprobacion')


puts " ✅"
print "Updating SapCodes: "
p "CODMOD"

SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'R',     description: 'Retención de crédito', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'RCOM',  description: 'Retención de crédito Complementaria', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'A',     description: 'Autorización', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'ACOM',  description: 'Autorización de crédito Complementaria', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'AD',    description: 'Autorización y Disposición de crédito', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'ADCOM', description: 'Autorización y Disposición de crédito Complementaria', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'ADD',   description: 'Autorización, Disposición y Obligación', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'ADOCOM',description: 'Autorización, Disposición y Obligación Complementaria', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'ADCON', description: 'AD Conjunto', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'ADOJ',  description: 'ADO Pagos a justificar', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'CODMOD', sicia_att: 'accounting_document', code: 'ACF',   description: 'Reposición/Cancelación de Fondos ACF', updated_by: 'SEEDS' )

p "TRAMITE"

SapCode.create!(sap_field: 'TRAMITE', sicia_att: 'workbench', code: 'GESTOR',       description: 'Órgano Gestor', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TRAMITE', sicia_att: 'workbench',code: 'INTERVENCION', description: 'Intervención', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TRAMITE', sicia_att: 'workbench',code: 'APROBACION',   description: 'Órgano de Aprobación', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TRAMITE', sicia_att: 'workbench',code: 'CONTABLE',     description: 'Contabilidad', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TRAMITE', sicia_att: 'workbench',code: 'FINALIZADO',   description: 'Expediente Contabilizado', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TRAMITE', sicia_att: 'workbench',code: 'ANULADO',      description: 'Expediente anulado', updated_by: 'SEEDS' )

p "NATURALEZA"

SapCode.create!(sap_field: 'NATURALEZA', sicia_att: 'expense_nature', code: 'ANUAL',      description: 'Gasto del ejercicio', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'NATURALEZA', sicia_att: 'expense_nature', code: 'PLURIANUAL', description: 'Gasto de varios ejercicios', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'NATURALEZA', sicia_att: 'expense_nature', code: 'ANTICIPADA', description: 'Gasto de ejercicios futuros', updated_by: 'SEEDS' )

p "TIPOS DE CONTRATOS"

SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '01', description: 'Contrato de obras', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '02', description: 'Contrato de gestión de servicios público', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '03', description: 'Contrato de suministros', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '04', description: 'Contrato de consultoría y asistencia', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '05', description: 'Contrato de servicios', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '06', description: 'Contrato de concesiones de obras pública', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '07', description: 'Contrato administrativo especial', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '08', description: 'Contrato privado', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '09', description: 'Compras centralizadas', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '10', description: 'Servicios centralizados', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '11', description: 'Reconocimiento extrajudicial de crédito', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '12', description: 'Convalidaciones', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '13', description: 'Tramitación de emergencia', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '14', description: 'Gastos de personal', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '15', description: 'Gastos financieros', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '16', description: 'Subvenciones y ayudas', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '17', description: 'Pagos a justificar', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '18', description: 'Anticipos de caja fija', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '19', description: 'Intereses de demora', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '20', description: 'Convenios', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '21', description: 'Transferencias "intermunicipales"', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '22', description: 'Gastos debidamente comprometidos', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '23', description: 'Otros expedientes excluidos TRLCAP', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '24', description: 'Acuerdos para no disponibilidad', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '25', description: 'Expropiaciones', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '26', description: 'Contrato colaboración s.publ. y s.priv.', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '27', description: 'Servicios bancarios', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '30', description: 'Indemnizaciones formadores no funcionar.', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '40', description: 'Indemnización al contratista', updated_by: 'SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', sicia_att: 'contract_type', code: '99', description: 'OTROS', updated_by: 'SEEDS' )


puts " ✅"
print "Importing Sap Codes: "

print "Importing societies... "
Rake::Task['sap_import:societies'].invoke

print "Importing manager bodies ..."
Rake::Task['sap_import:manager_bodies'].invoke

print "Importing approval bodies ..."
Rake::Task['sap_import:approval_bodies'].invoke

print "Importing adjudication ways ..."
Rake::Task['sap_import:adjudication_ways'].invoke

puts " ✅"
puts "End of process!!!"