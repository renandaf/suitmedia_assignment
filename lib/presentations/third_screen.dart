import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:suitmedia_assignment/provider/preferences_provider.dart';
import 'package:suitmedia_assignment/provider/userlist_provider.dart';
import 'package:suitmedia_assignment/utils/result_state.dart';
import 'package:suitmedia_assignment/widgets/card_user.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});
  static const routeName = '/third';

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final scrollController = ScrollController();
  Future<void> _refresh() async {
    context.read<UserListProvider>().refresh();
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 1,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Third Screen",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            )),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: Consumer<UserListProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.state == ResultState.hasData) {
                return Consumer<PreferencesProvider>(
                    builder: (context, provider, child) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: state.result.data.length,
                          itemBuilder: (context, index) {
                            var user = state.result.data[index];
                            return CardUser(
                              user: user,
                              onTap: () {
                                provider.setUsername(
                                    "${user.firstName} ${user.lastName}");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('User selected'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                });
              } else if (state.state == ResultState.noData ||
                  state.state == ResultState.error) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: 130.w,
                    child: Center(
                      child: Text(state.message,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Material(
                    child: Text(''),
                  ),
                );
              }
            },
          ),
        ));
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        context.read<UserListProvider>().hasMore) {
      context.read<UserListProvider>().fetchUser();
    }
  }
}
