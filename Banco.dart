
void main()
{
    Banco banco = Banco.Cliente(cliente: "Bruno Antonio", conta: "87643234", agencia: "654", diaNascimentoCliente: 2, mesNascimentoCliente: 10, anoNascimentoCliente: 2004);

    banco.Depositar(5000);
    banco.InfoCliente();
    banco.Sacar(500);
    print(banco.limiteDiario);
    banco.InfoCliente();
    banco.Sacar(5000);
    print(banco.limiteDiario);
    banco.InfoCliente();
    banco.Sacar(500);
    print(banco.limiteDiario);
    banco.InfoCliente();
    banco.Sacar(500);
    print(banco.limiteDiario);
    banco.InfoCliente();
    banco.Sacar(500);
    print(banco.limiteDiario);
    banco.InfoCliente();
    banco.Sacar(500);
    print(banco.limiteDiario);
    banco.InfoCliente();
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

    void Depositar(double valor)
    {
        saldo = saldo + valor;
    }

    void Sacar(double valor)
    {
        if(limiteDiario <= 0 || valor > limiteDiario){
            print("Você ultrapassou o limite de valor diario de saques. Tente sacar um valor menor ou igual que $limiteDiario");
        }else{
            saldo = saldo - valor;
            limiteDiario = limiteDiario - valor;
        }
    }
    
    void InfoCliente()
    {
        print("Cliente: $cliente; Conta: $conta; Agencia: $agencia; Saldo: $saldo");
    }
}