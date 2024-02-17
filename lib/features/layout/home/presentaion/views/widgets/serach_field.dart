import 'package:flutter/material.dart';
class SerachField extends StatelessWidget {
  const SerachField({
    super.key,
  });  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF5F5F5)),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
                onChanged: (value) {
                  // BlocProvider.of<SearchCubit>(context)
                  //     .search(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                )),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune_outlined,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }
}
