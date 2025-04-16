import 'package:flutter/material.dart';
import 'package:mint/features/training/domain/entities/training.dart';
import 'package:mint/features/training/presentation/views/users_list_view.dart';
import 'package:mint/features/training/presentation/widgets/search_bar.dart';

class TrainingDataView extends StatefulWidget {
  final Training training;
  const TrainingDataView({super.key, required this.training});

  @override
  State<TrainingDataView> createState() => _TrainingDataViewState();
}

class _TrainingDataViewState extends State<TrainingDataView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.training.slotGroups.length,
      vsync: this,
    );
    _tabController.addListener(_handleTabChange);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentSlotGroup = widget.training.slotGroups[_tabController.index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            indicatorWeight: 3.0,
            tabAlignment: TabAlignment.start,
            tabs:
                widget.training.slotGroups
                    .map(
                      (slotGroup) =>
                          Tab(text: slotGroup.slotGroupName, height: 46),
                    )
                    .toList(),
          ),
        ),

        // Search bar
        SearchBarWidget(
          searchController: _searchController,
          focusNode: _searchFocusNode,
          onClear: () {
            _searchController.clear();
            _searchFocusNode.unfocus();
          },
        ),

        // Event title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                'Event: ',
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
              Expanded(
                child: Text(
                  widget.training.eventName,
                  style: TextStyle(
                    color: Color(0xFF1B4278),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        // User list with filtering
        Expanded(
          child: UsersListView(
            resources:
                currentSlotGroup.resources
                    .where(
                      (user) =>
                          _searchQuery.isEmpty ||
                          user.firstName.toLowerCase().contains(
                            _searchQuery.toLowerCase(),
                          ) ||
                          user.name.toLowerCase().contains(
                            _searchQuery.toLowerCase(),
                          ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
