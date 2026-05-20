# 1. Creación de la estructura de Unidades Organizativas (OUs)
New-ADOrganizationalUnit -Name "CLINICA_VET" -Path "DC=clinicaveterinariatfg,DC=com"
New-ADOrganizationalUnit -Name "EQUIPOS" -Path "OU=CLINICA_VET,DC=clinicaveterinariatfg,DC=com"
New-ADOrganizationalUnit -Name "USUARIOS" -Path "OU=CLINICA_VET,DC=clinicaveterinariatfg,DC=com"

# 2. Creación de Grupos de Seguridad por departamento
New-ADGroup -Name "G_VETERINARIOS" -GroupCategory Security -GroupScope Global `
    -Path "OU=USUARIOS,OU=CLINICA_VET,DC=clinicaveterinariatfg,DC=com"

New-ADGroup -Name "G_RECEPCION" -GroupCategory Security -GroupScope Global `
    -Path "OU=USUARIOS,OU=CLINICA_VET,DC=clinicaveterinariatfg,DC=com"

# 3. Creación de usuarios con contraseña predefinida segura
$Password = ConvertTo-SecureString "<tu_password_aqui>" -AsPlainText -Force

# Usuario Juan Veterinario
New-ADUser -Name "Juan Veterinario" -SamAccountName "j_veterinario" `
    -UserPrincipalName "j_veterinario@clinicaveterinariatfg.com" `
    -Path "OU=USUARIOS,OU=CLINICA_VET,DC=clinicaveterinariatfg,DC=com" `
    -AccountPassword $Password -Enabled $true
Add-ADGroupMember -Identity "G_VETERINARIOS" -Members "j_veterinario"

# Usuario Maria Recepcion
New-ADUser -Name "Maria Recepcion" -SamAccountName "m_recepcion" `
    -UserPrincipalName "m_recepcion@clinicaveterinariatfg.com" `
    -Path "OU=USUARIOS,OU=CLINICA_VET,DC=clinicaveterinariatfg,DC=com" `
    -AccountPassword $Password -Enabled $true
Add-ADGroupMember -Identity "G_RECEPCION" -Members "m_recepcion"