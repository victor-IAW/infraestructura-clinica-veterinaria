$RutaMysql = "C:\Herramientas\mysql.exe"
$IP_VPS = "212.227.149.26"
$Usuario = "lector_clinica"
$BaseDatos = "wordpress"
$ArchivoDestino = "C:\Empresa\Recepcion\Citas_Hoy.txt"

Write-Host "Extrayendo los datos de los pacientes..." -ForegroundColor Cyan

# Ahora le pedimos que lea directamente los detalles (las respuestas reales)
$Query = "SELECT * FROM wp_vxcf_leads_detail ORDER BY id DESC LIMIT 50;"

# Ejecutamos la orden
& $RutaMysql -h $IP_VPS -u $Usuario --password="Clinica2026!" -D $BaseDatos -e $Query > $ArchivoDestino

Write-Host "¡Exito total! Citas descargadas en tu carpeta." -ForegroundColor Green