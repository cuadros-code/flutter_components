import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = ''; 
  String _email = ''; 
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Fuerza'];

  TextEditingController _inputDateController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0 ),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        counter: Text('Letras ${_name.length}'),
        hintText: 'Nombre',
        labelText: 'Nombre',
        helperText: 'Solo nombre $_name',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: ( value ){
        setState(() {
          _name = value;
        });
      },
    );

  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email_outlined)
      ),
      onChanged: ( value ){
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: ( value ){
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _crearFecha() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){

          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate();

      },
    );
  }

  _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
        _fecha = picked.toString();
        _inputDateController.text = _fecha;
      });
    }

  }

  
  Widget _crearDropdown() {

    List<DropdownMenuItem<String>> getOpciones = [];

    _poderes.forEach((element) {
      getOpciones.add(
        DropdownMenuItem(
          child: Text(element),
          value: element,
        )
      );
    });

    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          items: getOpciones,
          value: _opcionSeleccionada,
          onChanged: ( opt ){
            setState(() {
              _opcionSeleccionada = opt.toString();
            });
          },
        ),
      ],
    );
  }


  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_name'),
      subtitle: Text('Email: $_email '),
      trailing: Text(_opcionSeleccionada),
    );
  }


  



}