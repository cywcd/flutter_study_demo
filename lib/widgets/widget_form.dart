// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget tileSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is Text widget',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ))
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Form'),
      ),
      body: ListView(
        children: [
          tileSection,
          const FormComponent(),
        ],
      ),
    );
  }
}

class FormComponent extends StatefulWidget {
  const FormComponent({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormComponentState();
  }
}

class FormComponentState extends State<FormComponent> {
  bool _switchVal = true;
  bool _checkboxVal = true;
  int _radioVal = 1;
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _passTextController.addListener(() {
      print(_passTextController.text);
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: _userNameTextController,
                decoration: const InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  icon: Icon(Icons.personal_injury_rounded),
                ),
                validator: (val) {
                  if (val?.isEmpty ?? false) {
                    return '请输入用户名';
                  } else if (val.toString().length >= 6) {
                    return '请输入小于6位的用户名';
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                  child: const Text('提交'),
                  onPressed: () {
                    if (!(_formKey.currentState as FormState).validate()) {
                      print('用户名：${_userNameTextController.text}');
                      print('提交数据给后台');
                    } else {
                      print('请完善提交内容');
                    }
                  }),
            ],
          ),
        ),
        Switch(
          value: _switchVal,
          onChanged: (val) => {
            setState(() {
              _switchVal = !val;
            }),
          },
        ),
        Checkbox(
          value: _checkboxVal,
          onChanged: (val) => {
            setState(() {
              _checkboxVal = val!;
            }),
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('男'),
            Radio(
              value: 1,
              onChanged: (val) => {
                setState(() {
                  _radioVal = val!;
                }),
              },
              groupValue: _radioVal,
            ),
            const SizedBox(width: 20),
            const Text('女'),
            Radio(
              value: 2,
              onChanged: (val) => {
                setState(() {
                  _radioVal = val!;
                }),
              },
              groupValue: _radioVal,
            ),
          ],
        ),
        const TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: '用户名',
            hintText: '请输入用户名',
            prefixIcon: Icon(Icons.assignment_ind),
          ),
          keyboardType: TextInputType.phone,
        ),
        TextField(
          autofocus: true,
          decoration: const InputDecoration(
            labelText: '密码',
            hintText: '请输入密码',
            prefixIcon: Icon(Icons.remove_red_eye),
          ),
          keyboardType: TextInputType.text,
          obscureText: true,
          controller: _passTextController,
        ),
      ],
    );
  }
}
