part of 'contact_list_bloc.dart';

class ContactListState {
  final List<ContactModel> contactList;

  List<Object?> get props => [contactList];

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  bool isEditMode = false;

  int? contactIndex;

  ScrollController scrollController = ScrollController();

  ContactListState.empty() : contactList = [];

  ContactListState.list(this.contactList);

  ContactListState.form(
    this.nameController,
    this.numberController,
    this.contactList,
    this.isEditMode,
    this.contactIndex,
    this.scrollController,
  );
}
