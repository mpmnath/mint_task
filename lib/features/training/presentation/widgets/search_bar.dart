import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final TextEditingController searchController;
  final FocusNode? focusNode;
  final VoidCallback? onClear;

  const SearchBarWidget({
    super.key,
    required this.searchController,
    this.focusNode,
    this.onClear,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget>
    with TickerProviderStateMixin {
  bool _isActive = false;
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_onFocusChange);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    _animationController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (widget.focusNode!.hasFocus && !_isActive) {
      _activateSearch();
    }
  }

  void _activateSearch() {
    setState(() {
      _isActive = true;
    });
    _animationController.forward();
  }

  void _deactivateSearch() {
    setState(() {
      _isActive = false;
      widget.searchController.clear();
      widget.focusNode?.unfocus();
      if (widget.onClear != null) {
        widget.onClear!();
      }
    });
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    _widthAnimation = Tween<double>(
      begin: width - 32,
      end: width - 110,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                width: _widthAnimation.value,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextField(
                        controller: widget.searchController,
                        focusNode: widget.focusNode,
                        textInputAction: TextInputAction.search,
                        onTap: () {
                          if (!_isActive) {
                            _activateSearch();
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          suffixIcon:
                              widget.searchController.text.isNotEmpty
                                  ? IconButton(
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      widget.searchController.clear();
                                      setState(() {});
                                    },
                                  )
                                  : null,
                        ),
                        onChanged: (value) {
                          // Force rebuild to show/hide clear button
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          AnimatedOpacity(
            opacity: _isActive ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 800),
            child:
                _isActive
                    ? TextButton(
                      onPressed: _deactivateSearch,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
