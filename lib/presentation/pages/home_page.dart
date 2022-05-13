import 'package:bloc_example/business_logic.dart';
import 'package:bloc_example/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class HomePage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdateInProgress) {
          Loader.show(
            context,
            overlayColor: Colors.black.withOpacity(.6),
            progressIndicator: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          Loader.hide();
          if (state is ProfileUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Il profilo è stato aggiornato correttamente'),
              ),
            );
          } else if (state is ProfileUpdateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Errore: uno o più campi vuoti'),
              ),
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Modifica profilo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Nome',
                style: PresetTextStyle.black15w600,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Inserisci il tuo nome',
                ),
                controller: _nameController,
              ),
              const SizedBox(height: 30),
              const Text(
                'Cognome',
                style: PresetTextStyle.black15w600,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Inserisci il tuo cognome',
                ),
                controller: _surnameController,
              ),
              const SizedBox(height: 50),
              SaveButton(
                onPressed: () {
                  context.read<ProfileBloc>().add(
                        ProfileUpdated(
                          _nameController.text,
                          _surnameController.text,
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
