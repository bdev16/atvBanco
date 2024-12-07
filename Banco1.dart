
import 'dart:io';

void main()
{
    Banco banco = Banco.Cliente(cliente: "Bruno Antonio", conta: "87643234", agencia: "654", diaNascimentoCliente: 2, mesNascimentoCliente: 10, anoNascimentoCliente: 2004);
    UI(banco);
}

class Banco
{
    String? agencia;
    String? conta;
    String? cliente;
    int? diaNascimentoCliente;
    int? mesNascimentoCliente;
    int? anoNascimentoCliente;
    String? dataNascimentoCliente;
    double saldo = 0;
    double chequeEspecial = 500;
    double limiteDiario = 2000;

    Banco.Cliente({required this.cliente, required this.conta, required this.agencia, required this.diaNascimentoCliente, required this.mesNascimentoCliente, required this.anoNascimentoCliente});

    void Depositar()
    {
        print("Informe um valor para deposito: ");
        double valor = double.parse(stdin.readLineSync()!);
        if(valor == '')
        {
          print('Informe um valor válido. Não é possivel sacar um valor do tipo Caractere!');
        } else{
          saldo = saldo + valor;
        }
        
    }

    void Sacar()
    {
        print("Informe um valor para sacar: ");
        double valor = double.parse(stdin.readLineSync()!);
        if(valor == '')
        {
          print('Informe um valor válido. Não é possivel sacar um valor do tipo Caractere!');
        } else if(saldo == 0)
        {
          print("Voce não tem nenhum dinheiro na sua conta. Seu saldo atual é de $saldo");
        } else{
          if( valor > limiteDiario || limiteDiario <= 0 ){
            print("Você ultrapassou o limite de valor diario de saques. Tente sacar um valor menor ou igual que R\$ 2000.00");
          }else{
            saldo = saldo - valor;
            limiteDiario = limiteDiario - valor;
          }
        }
    }
    
    void InfoCliente()
    {
        print("Cliente: $cliente; Conta: $conta; Agencia: $agencia; Saldo: $saldo");
    }
}

void UI(Banco banco)
{
  String escolhaUsuario = '';
  do{
    print("1. Sacar; 2. Depositar; 3. Perfil; 4. Sair");
    escolhaUsuario = stdin.readLineSync()!;
    switch(escolhaUsuario)
    {
      case '1':
        banco.Sacar();
        break;
      case '2':
        banco.Depositar();
        break;
      case '3':
        banco.InfoCliente();
        break;
      case '4':
        print('Encerrando sistema...');
        break;
      default:
        print('A opção escolhida não é uma das disponiveis para escolha.');
        break;
    }
  }while(escolhaUsuario != '4');
}