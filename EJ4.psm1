function options
{
Write-Host "Ingrese la opcion a elegir" -Separator 
$opc = Read-Host -Prompt '[1] Ver equipos y su ID'`n '[2] Crear Equipo'`n '[3] Eliminar Equipo'`n '[4] Agregar usuario a un equipo'`n '[5] Cambiar imagen de equipo' `n '[6] Reporte de teams' `n '[7] Salir'
switch($opc){
1 {
idteams
options
} 
2 {
newteam
options
} 
default {
Write-Host "Opcion no valida"
} 
3 {
deleteteam
options
} 
4{
adduse
options
} 
5{
cambfoto
options
} 
6{
reporte
options
}
7{
break
}
}
}

function idteams
{
$usuario = Read-Host 'Ingrese su correo'
Get-Team -User $usuario | Format-Table -Property GroupId, DisplayName
}

function newteam
{
$nomteam = Read-Host 'Ingrese el nombre de el nuevo equipo'
New-Team -DisplayName $nomteam
}

function deleteteam
{
$idgrup = Read-Host 'Ingrese la ID de el grupo si desea verificar una id precione [1]'
switch($idgrup){
1 {
$usuario = Read-Host 'Ingrese su correo'
Get-Team -User $usuario | Format-Table -Property GroupId, DisplayName
deleteteam
} default{

Remove-Team -GroupId $idgrup
}
}
}

function adduse{
$correo = Read-Host 'Ingrese el correo de el ususario a ingresar'
$grup = Read-Host 'Ingrese la ID de el grupo si desea verificar una id precione [1]'
switch($grup){
1 {
$usuario = Read-Host 'Ingrese su correo para ingresar a sus grupos'
Get-Team -User $usuario | Format-Table -Property GroupId, DisplayName
adduse
} default{
Add-TeamUser -User $correo -GroupId $grup
Write-Host 'Se agrego correctamente'
}
}
}

function cambfoto{
$grupo = Read-Host 'Ingrese la id de el grupo o ingrese [1] para verificar'
$ruta = Read-Host 'Ingrese la ruta desde la raiz'
switch($grupo){
1 {
$usuario = Read-Host 'Ingrese su correo para ingresar a sus grupos'
Get-Team -User $usuario | Format-Table -Property GroupId, DisplayName
cambfoto
}default{
Set-TeamPicture -GroupId $grupo -ImagePath $ruta
Write-Host 'Se cambio la foto exitosamente'
}
}
}

function reporte{
$usuario = Read-Host 'Ingrese su correo'
$ruta = Read-Host 'Ingrese la ruta desde raiz con el nombre del archivo'
Get-Team -User $usuario | Out-File -FilePath $ruta
}