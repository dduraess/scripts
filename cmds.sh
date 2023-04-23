#!/usr/bin/bash

# buscar arquivo com conteúdo especificado
egrep -ir --include=*.{php,html,js} "(document.cookie|setcookie)"

# quebrar arquivo texto por tamanho
split -C 7m Desktop/eventos.txt Desktop/
# por linhas
split -l 20000 Desktop/eventos-bkp2.txt Desktop/

# encontrar texto e substituir (opção -i sobrescreve)
sed -i 's/string-buscada/string-nova/g' Desktop/eventos.txt

# So to delete all empty lines from a file called /tmp/data.txt, enter:
sed -i '/^$/d' /tmp/data.txt

# usar saída de um comando como entrada para outro comando e gerar nova saída em arquivo
history | grep jboss >Desktop/teste-saida.txt

# executar dois ou mais comandos (ou scripts) em seguida no terminal (&& roda o 2º se o primeiro executar com sucesso)
ls && more Desktop/teste-saida.txt

# procurar nome find <raiz da busca '.'> -type f=arquivo, d=diretorio; retornar com saida ls; | usar a saida do comando grep por 'palavra chave'
find . -type f -ls | grep 'comandos'

# restartar conexões de rede
sudo service network-manager restart

# set 2nd monitor res
xrandr --output HDMI-1 --mode 1360x768

# encontrar arquivo por data alteração
find . -type f -newermt 2017-09-24 ! -newermt 2017-09-25 -ls

# ordena por data modificação
ls -ltc

# Use the -prune primary. For example, if you want to exclude ./misc:
#
find . -path ./misc -prune -o -name '*.txt' -print

# To exclude multiple directories, OR them between parentheses.
#
find . -type d \( -path ./dir1 -o -path ./dir2 -o -path ./dir3 \) -prune -o -name '*.txt' -print

# And, to exclude directories with a specific name at any level, use the -name primary instead of -path.
#
find . -type d -name node_modules -prune -o -name '*.json' -print

find . -type d \( -path ./cobra-documentacao -o -path ./query -o -path ./tratapfn-doc -o -path ./sic-commons -o -path ./cobint-11472 \) -prune -o -name '*.sql' -print

# curl bulk
#
for i in {55..56}; do curl -O $(printf "http://www.example.com/%02d_episode_%d.mp3" $i $i); done

for i in {55..56}; do curl https://s3.amazonaws.com/ligonier-sermon-media/mp3/01_MAT01_$i.mp3 -o "01_MAT01_$i.mp3"; done

# sobrescreve o anterior com a literal entre aspas
curl https://s3.amazonaws.com/ligonier-sermon-media/mp3/01_MAT01_0{50,55,56}.mp3 -o "01_MAT01_0#1.mp3"

for i in {55..56}; do curl https://s3.amazonaws.com/ligonier-sermon-media/mp3/01_MAT01_$i.mp3 -o "01_MAT01_$i.mp3"; done

# JOB_1 inscrição pelo entreposto
ssh 27352403809@10.139.69.162 curl 'http://localhost:8080/cobra-batch2/jobs/JOB-07509-COBI_INSCRICAO_OTIMIZADA.json' -d jobParameters=mpct.batch.inicio.janela=202101010100,mpct.data.referencia=$(date '+%Y%m%d_%H%M'),mpct.number.slave.threads=5,mpct.number.slaves=1,cobi.cpf=0,cobi.cnpj=0,mpct.commit.interval=1

# JOB_1 HOMOLOGA
ssh 27352403809@10.139.69.162 curl 'http://10.39.20.94/cobra-batch2/jobs/JOB-07509-COBI_INSCRICAO_OTIMIZADA.json' -d jobParameters=mpct.batch.inicio.janela=202101010100,mpct.data.referencia=$(date '+%Y%m%d_%H%M'),mpct.number.slave.threads=5,mpct.number.slaves=1,cobi.cpf=0,cobi.cnpj=0,mpct.commit.interval=1

# JOB_2 HOMOLOGA
ssh 27352403809@10.139.69.162 curl 'http://10.39.20.94/cobra-batch2/jobs/JOB-07509-COBI_ENVIAR_PROCESSO_INSCRICAO_AO_SIDA.json' -d jobParameters=mpct.batch.inicio.janela=202101010100,mpct.data.referencia=$(date '+%Y%m%d_%H%M'),mpct.number.slave.threads=5,mpct.number.slaves=1,mpct.commit.interval=1

# JOB_3 HOMOLOGA
ssh 27352403809@10.139.69.162 curl 'http://10.39.20.94/cobra-batch2/jobs/JOB-07509-COBI_CONFIRMACAO_INSCRICAO.json' -d jobParameters=mpct.batch.inicio.janela=202101010100,mpct.data.referencia=$(date '+%Y%m%d_%H%M'),mpct.number.slave.threads=5,mpct.number.slaves=1,mpct.commit.interval=1

# ENVIAR ENTES HOMOLOGA
ssh 27352403809@10.139.69.162 curl 'http://10.39.20.94/cobra-batch2/jobs/JOB-07509-COBI_ENVIAR_ENTES.json' -d jobParameters=mpct.batch.inicio.janela=202101010100,mpct.data.referencia=$(date '+%Y%m%d_%H%M'),mpct.number.slave.threads=5,mpct.number.slaves=1,mpct.commit.interval=1

# ENVIAR ENTES_SEM_CONVENIO HOMOLOGA
ssh 27352403809@10.139.69.162 curl 'http://10.39.20.94/cobra-batch2/jobs/JOB-07509-COBI_ENVIAR_ENTES_SEM_CONVENIO.json' -d jobParameters=mpct.batch.inicio.janela=202101010100,mpct.data.referencia=$(date '+%Y%m%d_%H%M'),mpct.number.slave.threads=5,mpct.number.slaves=1,mpct.commit.interval=1

# NR linhas arquivo
wc -l

# Encontrar em que linha está uma dada string
# Given that your example only prints the line number of the first occurrence of the string, perhaps you are looking for:

awk '/string/{ print NR; exit }' input-file

# If you actually want all occurrences (eg, if the desired output of your example is actually "2\n3\n"), omit the exit.

# array contendo as linhas de um arquivo
readarray -t nis <../../scripts/listaNI

# iterar num array
for i in ${nis[@]}; do cno h $i; done

# serviço http (integração PGDAS)
echo -n '{"cnpjBasico": "03019237", listaDePas: [201904,201905]}' | http POST http://sinac-webservices.hom.serpro/wspgdasd2018/api/InscricaoOtimizada/ConsultarStatusMalhaLancamento

# saber data/hora do pull
git log -p -2

# com o resultado do comando acima, informar os arqs no cmd abaixo
ls -lct # <nome_arquivo>

# You could use sed's w flag with either /dev/stderr, /dev/tty, /dev/fd/2 if supported on your system. E.g. with an input file like:
#
# foo first
# second: missing
# third: foo
# none here
#
# running
#
sed -i '/foo/{
s//bar/g
w /dev/stdout
}' file
#
# outputs:
#
# bar first
# third: bar
#
# though file content was changed to:
#
# bar first
# second: missing
# third: bar
# none here
#
# So in your case, running:
#
find . -type f -printf '\n%p:\n' -exec sed -i '/foo/{
s//bar/g
w /dev/fd/2
}' {} \;
#
# will edit the files in-place and output:
#
#
# ./file1:
# bar stuff
# more bar
#
# ./file2:
#
# ./file3:
# bar first
# third: bar
#
# You could also print something like original line >>> modified line e.g.:
#
find . -type f -printf '\n%p:\n' -exec sed -i '/foo/{
h
s//bar/g
H
x
s/\n/ >>> /
w /dev/fd/2
x
}' {} \;
#
# edits the files in-place and outputs:
#
#
# ./file1:
# foo stuff >>> bar stuff
# more foo >>> more bar
#
# ./file2:
#
# ./file3:
# foo first >>> bar first
# third: foo >>> third: bar
#
# troca todo conteúdo texto, do diretório para baixo de 'davison' para s273524038

find . -type f -printf '\n%p:\n' -exec sed -i '/davison/{
s//s273524038/g
w /dev/fd/2
}' {} \;

# para busacar excetuando-se diretorio ou nome de diretório
#
# Use the -prune primary. For example, if you want to exclude ./misc:

find . -path ./misc -prune -o -name '*.txt' -print

# To exclude multiple directories, OR them between parentheses.

find . -type d \( -path ./dir1 -o -path ./dir2 -o -path ./dir3 \) -prune -o -name '*.txt' -print

# And, to exclude directories with a specific name at any level, use the -name primary instead of -path.

find . -type d -name node_modules -prune -o -name '*.json' -print

# p.ex.

find . -type d \( -name node_modules -o -path ./tratapfn-21621 -o -path ./cobra-documentacao \) -prune -o -name '*.py' -print
