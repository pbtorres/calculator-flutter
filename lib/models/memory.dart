class Memory {
  static const operations = ['+', '-', '/', 'x', '%', '='];
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  var _operation;
  String _value = '0';
  bool _wipeValue = false;
  String _lastCommand = '';

  //valida operações
  void applyComand(String command) {
    if (_isReplaceingOperation(command)) {
      _operation = command;
    }

    if (command == 'AC') {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigt(command);
    }
    _lastCommand = command;
  }

  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';
    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
      }
    } else {
      _buffer[0] = calculate();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();

      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
      print(_value);
    }
    _wipeValue = true;
  }

  // adiciona dígito no display
  _addDigt(String digt) {
    //quando o usuádio digitar ponto depois do zero não substituirá o zero
    final isDot = digt == '.';
    //substituir o zero pelo primeiro valor digitado
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    //verificar se já existe um . digitado
    if (isDot && _value.contains('.') && !wipeValue) {
      return;
    }

    final emptValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptValue : _value;
    _value = currentValue + digt;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
    print(_buffer);
  }

  //utilizar a ultima operacão escolhida pelo usuário
  _isReplaceingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  //limpar display
  _allClear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
  }

  //realiza as operações matemáticas
  calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
    }
  }

  String getValue() {
    return _value;
  }
}
