import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_bloc/model/contact_model.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactListBloc() : super(ContactListState.empty()) {
    on<DeleteContactEvent>(
      (event, emit) {
        state.contactList.removeAt(event.index);

        emit(ContactListState.list(state.contactList));
      },
    );

    on<UpdateContactEvent>(
      (event, emit) {
        ContactModel contact = ContactModel(
          name: state.nameController.text,
          number: state.numberController.text,
        );

        if (state.isEditMode) {
          state.isEditMode = false;
          state.contactList[state.contactIndex!] = contact;
        } else {
          state.contactList.add(contact);
        }

        state.nameController.clear();
        state.numberController.clear();

        debugPrint("Data List: ${state.contactList.toString()}");

        emit(ContactListState.list(state.contactList));
      },
    );

    on<EditContactEvent>(
      (event, emit) {
        debugPrint("data = $event, $emit");

        state.scrollController.jumpTo(0.0);
        state.isEditMode = true;

        final ContactModel contact = state.contactList[event.index];

        debugPrint('Contact Data : ${contact.toString()}');

        state.nameController.text = contact.name;
        state.numberController.text = contact.number;

        state.contactIndex = event.index;
        emit(
          ContactListState.form(
            state.nameController,
            state.numberController,
            state.contactList,
            state.isEditMode,
            state.contactIndex,
            state.scrollController,
          ),
        );
      },
    );
  }
}
