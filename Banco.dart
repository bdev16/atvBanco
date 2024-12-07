import 'dart:io';

void main()
{
  Banco banco = new Banco.Usuario(agencia: 380, conta: 1234354, cliente: "Robson Teixeira da Silva", diaNascimento: 1, mesNascimento: 4, anoNascimento: 1987);
  UI(banco);
}

class Banco
{
  int? _agencia;
  int? _conta;
  String? _cliente;
  int? _diaNascimento;
  int? _mesNascimento;
  int? _anoNascimento;
  String _dataNascimento = '';
  double _saldo = 0;
  double _chequeEspecial = 200;

  Banco()
  {

  }

  Banco.Usuario({required int agencia, required int conta, required String cliente, required int diaNascimento, required int mesNascimento, required int anoNascimento});

  // Banco(int agencia, int conta, String cliente, int diaNascimento, int mesNascimento, int anoNascimento, String dataNascimento, double saldo)
  // {
  //   this.agencia = agencia;
  //   this.conta = conta;
  //   this.cliente = cliente;
  //   this.diaNascimento = diaNascimento;
  //   this.mesNascimento = mesNascimento;
  //   this.anoNascimento = anoNascimento;
  //   this.dataNascimento = "$diaNascimento/$mesNascimento/$anoNascimento";
  //   this.saldo = saldo;
  // }

  set agencia(int? agencia)
  {
    _agencia = agencia;
  }

  int? get agencia
  {
    return _agencia;
  }

  set conta(int? conta)
  {
    _conta = conta;
  }

  int? get conta
  {
    return _conta;
  }

  set cliente(String? cliente)
  {
    _cliente = cliente;
  }

  String? get cliente
  {
    return _cliente;
  }

  set diaNascimento(int? diaNascimento)
  {
    _diaNascimento = diaNascimento;
  }

  int? get diaNascimento
  {
    return _diaNascimento;
  }

  set mesNascimento(int? mesNascimento)
  {
    _mesNascimento = mesNascimento;
  }

  int? get mesNascimento
  {
    return _mesNascimento;
  }

  set anoNascimento(int? anoNascimento)
  {
    _anoNascimento = anoNascimento;
  }

  int? get anoNascimento
  {
    return anoNascimento;
  }

  String get dataNascimento
  {
    return "$diaNascimento/$mesNascimento/$anoNascimento";
  }

  set saldo(double saldo)
  {
    _saldo = saldo;
  }

  double get saldo
  {
    return _saldo;
  }

  void depositar(double deposito)
  {
    saldo = saldo + deposito;
    print("Valor depositado com sucesso!");
  }

  void sacar(double saque)
  {
    double limiteDiario = 2000;

    if(saque > 0){
      if(saque > limiteDiario){
        print("O valor informado ultrapassa o limite diario pré-estabelecido de R\$ 2000,00");
        print("Informe um valor abaixo do limite!!");
      }else{
        if(saque > saldo)
        {
          saldo = (saldo - saque) - 200;
          limiteDiario = (limiteDiario - saque) - 200;
        }else
        {
          saldo = saldo - saque;
          limiteDiario = limiteDiario - saque;
        }
      }
    }else{
      print("Informe o valor acima de 0.");
    }
    
  }
}

void UI(Banco banco)
{
  while(true)
  {
    print("= = = BANCO LEGAL = = =");
    print("1.Sacar\n2.Depositar\n3.Informações do usuario\n4.Sair");
    String escolhaUsuario = stdin.readLineSync()!;
    switch(escolhaUsuario)
    {
      case '1':
        print("Realizar Deposito");
        print("Informe um valor: ");
        double valor = double.parse(stdin.readLineSync()!);
        banco.depositar(valor);
        String? inputUsuario = stdin.readLineSync();
        break;
      case '2':
        print("Realizar saque");
        print("Informe um valor: ");
        double valor = double.parse(stdin.readLineSync()!);
        banco.sacar(valor);
        String? inputUsuario = stdin.readLineSync();
        break;
      case '3':
        print("Nome: ${banco.cliente}\nBanco: ${banco.conta}\nAgencia: ${banco.agencia}\nData de nascimento: ${banco.dataNascimento}");
        String? inputUsuario = stdin.readLineSync();
        break;
      case '4':
        print("Saindo do banco...");
        return;
      default:
        print("A opção informada não existe!!");
        break;
    }
  }
}