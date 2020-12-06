import 'package:flutter/material.dart';
import 'package:mobile/components/custom_surfix_icon.dart';
import 'package:mobile/components/form_error.dart';
import 'package:mobile/http/auth_rest.dart';
import 'package:mobile/models/UserID.dart';
import 'package:mobile/screens/proposta/proposta_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String password;
  bool remember = false;
  final List<String> errors = [];

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUsernameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            key: Key(keyBtnLogin),
            text: "Login",
            press: () {
              if (_formKey.currentState.validate()) {
                errors.clear();
                _formKey.currentState.save();
                final AuthRestClient _authRest = AuthRestClient();
                final String login = _usernameController.text;
                final String senha = _passwordController.text;

                try {
                  print('Init login');
                  _authRest.realizarLogin(login, senha).then((ok) {
                      UserId.login = login;
                      print(UserId.login);
                    if (ok)
                      Navigator.pushNamed(context, PropostaScreen.routeName);
                    else {
                      addError(error: loginError);
                      return "";
                    }
                  });
                } catch (e) {
                  addError(error: "Falha ao realizar login");
                  return "";
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      key: Key(keyTxtPasswordLogin),
      controller: _passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: passNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Senha",
        hintText: passInfo,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      key: Key(keyTxtUsernameLogin),
      controller: _usernameController,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: usernameNullError);
        }
        return null;
      },
      autocorrect: false,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: usernameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Usuário",
        hintText: usernameInfo,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/user.svg"),
      ),
    );
  }
}
