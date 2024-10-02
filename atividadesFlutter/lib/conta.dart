// Exercício 2
class Conta<T> {
  T tipo;
  double saldo;

  Conta(this.tipo, this.saldo);

  void depositar(double valor) {
    saldo += valor;
  }

  void sacar(double valor) {
    saldo -= valor;
  }
}

void main() {
  var contaCorrente = Conta<String>('Corrente', 1000.0);
  var contaPoupanca = Conta<String>('Poupança', 1500.0);

  contaCorrente.depositar(200);
  contaPoupanca.depositar(1000);

  print(contaCorrente.saldo);
  print(contaPoupanca.saldo);

  contaCorrente.sacar(100);
  contaPoupanca.sacar(800);

  print(contaCorrente.saldo);
  print(contaPoupanca.saldo);
}
