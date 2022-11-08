$Bot = 0
$Utilisateur = 0

Do {
    $Random = Get-Random  "Pierre" ,"Feuille", "Ciseaux" # Choix de la valeur aléatoire
    Write-Host "L'ordinateur a fait son choix"
    
    # Choix de la valeur utilisateur, avec boucle pour vérifier que la valeur est bien une de celles autorisées
    Do {
    $Choix = read-host "Pierre / Feuille / Ciseaux"
    } Until (($Choix -eq "Pierre") -or ($Choix -eq "Ciseaux") -or ($Choix -eq "Feuille"))
    
    Write-Host "Vous avez choisi" $Choix
    
    #----- Pause -----
    Start-Sleep -Seconds 1
    
    #----- Calcul de la victoire, défaite ou égalité -----
    $Victoire = "Vous avez gagné contre : "
    $Perdu = "Vous avez perdu contre : "
    $Egalite = "Match Nul "
    
    switch($Choix){
    
        "Pierre" {switch($Random){
            "Pierre" {Write-host $Egalite ; Break}
            "Feuille" {write-host $Perdu $Random; $bot ++; Break}
            "Ciseaux" {Write-host $Victoire $Random; $Utilisateur ++; Break}
        }}
    
        "Feuille" {switch($Random){
            "Pierre" {write-host $Victoire $Random; $Utilisateur ++; Break}
            "Feuille" {write-host $Egalite; Break}
            "Ciseaux" {Write-host $Perdu $Random; $bot ++; Break}
        }}
    
        "Ciseaux" {switch($Random){
            "Pierre" {write-host $Perdu $Random; $bot ++; Break}
            "Feuille" {write-host $Victoire $Random; $Utilisateur ++; Break}
            "Ciseaux" {Write-host $Egalite; Break}
        }}
    }
    
    #----- Compteur ------ 

    write-host "Vous avez "$Utilisateur "point/s" "Le bot a" $Bot

    Do{
    $Rejouer = Read-Host "Voulez-vous rejouer ? oui ou non"
    } Until (($Rejouer -eq "Oui") -or ($Rejouer -eq "O") -or ($Rejouer -eq "Non") -or ($Rejouer -eq "N"))


} while (($Rejouer -eq "oui") -or ($Rejouer -eq "O"))
    