files=(S2703)


for f in "${files[@]}"
do
    time acs-pipe --config-file="acs-config/$f.yaml" fetch --acs-key d0a3481f70837de29a56f7a3b7df087007e942e1
    time acs-pipe --config-file="acs-config/$f.yaml" process
    time acs-pipe --config-file="acs-config/$f.yaml" sql --schema acs --dbms Postgres

    #time acs-pipe --config-file="acs-config/$f.yaml" load -d acs --schema acs --database-username postgres --dbms Postgres local

    time acs-pipe --config-file="acs-config/$f.yaml" load -d datausa_vp --schema acs --dbms Postgres remote --ssh-host $DB_PG_HOST --ssh-username deploy --ssh-key ~/.ssh/id_rsa_dw_deploy
done