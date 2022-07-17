#!/bin/bash
#Desenvolvido por Antônio Pinheiro
#Esse Script é compatível com sistemas Debian Based!!!

distro=$(lsb_release -i | cut -f 2-)

instalar_open_jdk(){
    echo
    echo "*************************************************************"
    echo "Qual versão do Open JDK deseja instalar?"
    echo "Exemplo: Digite 8, 11, 17 para instalar o Open JDK ou 0 para voltar ao menu principal"
    echo "*************************************************************"
    echo
    read versao

      sudo apt update
      if [[ $versao == '0' ]]; then
        funcao_principal
        else 
            if sudo apt install openjdk-$versao* -y; then
            echo
            echo "************************************"
            echo "OpenJDK instalado com sucesso!!!"
            echo "************************************"
            else 
                echo
                echo "****************************************************************"
                echo "A versão do OpenJDK não é suportada, selecione outra versão..."
                echo "****************************************************************"
            fi
      fi
      funcao_principal
    
}

instalar_open_jdk_amazon_coretto(){
    echo
    echo "********************************************************************"
    echo "Qual versão do Amazon Corretto deseja instalar?"
    echo "Exemplo: Digite 8, 11, 17 ou 18 para instalar o Corretto ou 0 para voltar ao menu principal"
    echo "********************************************************************"
    echo
    read versao

    if [[ $versao == '0' ]]; then
        funcao_principal
        else
               wget https://corretto.aws/downloads/latest/amazon-corretto-$versao-x64-linux-jdk.deb
            if sudo apt install ./amazon-corretto-$versao-x64-linux-jdk.deb; then
                rm amazon-corretto-$versao-x64-linux-jdk.deb
                echo "*************************************************************************"
                echo "Amazon Corretto instalado com sucesso!!!"
                echo "*************************************************************************"
                funcao_principal
            else 
                echo "*************************************************************************"
                echo "Ocorreu um erro durante a instalação ou a versão selecionada não existe"
                echo "Escolha outra versão"
                echo "*************************************************************************"
                funcao_principal
            fi
    fi

}

alternar_entre_versoes_jdk(){
    echo
    echo "Selecione uma versão do Java JDK que deseja utilizar"
    sudo update-alternatives --config java
    funcao_principal
}

funcao_principal(){
echo
echo "Selecione uma opção"
echo
echo "1 - Instalar Java JDK - Implementação Open JDK"
echo "2 - Instalar Java JDK - Implementação Corretto da Amazon"
echo "3 - Alterar a versão do JDK no sistema"
echo "4 - Exit"
echo

while :
do
  read select_option
  case $select_option in

    1)  instalar_open_jdk;;
    2)  instalar_open_jdk_amazon_coretto;;
    3)  alternar_entre_versoes_jdk;;
    4)  exit

  esac
done
}

funcao_principal