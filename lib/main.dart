import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vietmap_reorderable_list/widgets/vietmap_reorderable_list.dart';

/// Flutter code sample for [ReorderableListView].

void main() => runApp(ReorderableApp());

// ignore: must_be_immutable
class ReorderableApp extends StatelessWidget {
  ReorderableApp({super.key});
  var appbar = AppBar(title: const Text('ReorderableListView Sample'));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appbar,
        body: ReorderableExample(appbarHeight: appbar.preferredSize.height),
      ),
    );
  }
}

class MockData {
  final String name;

  int timeStamp;
  MockData({required this.name, required this.timeStamp});
}

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key, required this.appbarHeight});
  final double appbarHeight;
  @override
  State<ReorderableExample> createState() => _ReorderableListViewExampleState();
}

class _ReorderableListViewExampleState extends State<ReorderableExample> {
  List<GlobalKey> itemKeys = [];
  int? oldIndexOfItem;
  int? currentPosition;
  Offset? listViewOffset;
  double? recentIndex;
  int? time;
  GlobalKey scrollViewKey = GlobalKey();
  ScrollController scrollController = ScrollController();
  final List<MockData> data = [
    MockData(name: 'Item 1', timeStamp: 1710992339000),
    MockData(name: 'Item 2', timeStamp: 1710993339000),
    MockData(name: 'Item 3', timeStamp: 1710994339000),
    MockData(name: 'Item 4', timeStamp: 1710995339000),
    MockData(name: 'Item 5', timeStamp: 1710996339000),
    MockData(name: 'Item 6', timeStamp: 1710997339000),
    MockData(name: 'Item 7', timeStamp: 1710998339000),
    MockData(name: 'Item 8', timeStamp: 1710999339000),
    MockData(name: 'Item 9', timeStamp: 1711000339000),
    MockData(name: 'Item 10', timeStamp: 1711001339000),
    MockData(name: 'Item 11', timeStamp: 1711002339000),
    MockData(name: 'Item 12', timeStamp: 1711003339000),
    MockData(name: 'Item 13', timeStamp: 1711004339000),
    MockData(name: 'Item 14', timeStamp: 1711005339000),
    MockData(name: 'Item 15', timeStamp: 1711006339000),
    MockData(name: 'Item 16', timeStamp: 1711007339000),
    MockData(name: 'Item 17', timeStamp: 1711008339000),
    MockData(name: 'Item 18', timeStamp: 1711009339000),
    MockData(name: 'Item 19', timeStamp: 1711010339000),
    MockData(name: 'Item 20', timeStamp: 1711011339000),
    MockData(name: 'Item 21', timeStamp: 1711012339000),
    MockData(name: 'Item 22', timeStamp: 1711013339000),
    MockData(name: 'Item 23', timeStamp: 1711014339000),
    MockData(name: 'Item 24', timeStamp: 1711015339000),
    MockData(name: 'Item 25', timeStamp: 1711016339000),
    MockData(name: 'Item 26', timeStamp: 1711017339000),
    MockData(name: 'Item 27', timeStamp: 1711018339000),
    MockData(name: 'Item 28', timeStamp: 1711019339000),
    MockData(name: 'Item 29', timeStamp: 1711020339000),
    MockData(name: 'Item 30', timeStamp: 1711021339000),
    MockData(name: 'Item 31', timeStamp: 1711022339000),
    MockData(name: 'Item 32', timeStamp: 1711023339000),
    MockData(name: 'Item 33', timeStamp: 1711024339000),
    MockData(name: 'Item 34', timeStamp: 1711025339000),
    MockData(name: 'Item 35', timeStamp: 1711026339000),
    MockData(name: 'Item 36', timeStamp: 1711027339000),
    MockData(name: 'Item 37', timeStamp: 1711028339000),
    MockData(name: 'Item 38', timeStamp: 1711029339000),
    MockData(name: 'Item 39', timeStamp: 1711030339000),
    MockData(name: 'Item 40', timeStamp: 1711031339000),
    MockData(name: 'Item 41', timeStamp: 1711032339000),
    MockData(name: 'Item 42', timeStamp: 1711033339000),
    MockData(name: 'Item 43', timeStamp: 1711034339000),
    MockData(name: 'Item 44', timeStamp: 1711035339000),
    MockData(name: 'Item 45', timeStamp: 1711036339000),
    MockData(name: 'Item 46', timeStamp: 1711037339000),
    MockData(name: 'Item 47', timeStamp: 1711038339000),
    MockData(name: 'Item 48', timeStamp: 1711039339000),
    MockData(name: 'Item 49', timeStamp: 1711040339000),
    MockData(name: 'Item 50', timeStamp: 1711041339000),
  ];
  @override
  void initState() {
    scrollController.addListener(() {
      // print('+++++++++++++++++++++++++++++++++++++++++');
      // print(scrollController.position.pixels);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Container(
      color: Colors.red.withOpacity(0.2),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 95,
            child: Container(
              width: 5,
              height: MediaQuery.sizeOf(context).height,
              color: Colors.red,
            ),
          ),
          VietmapReorderableListView(
            key: scrollViewKey,
            scrollController: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            onReorderStart: (index) {
              // print('-----------------zzz');
            },
            children: List.generate(50, (index) {
              itemKeys.add(GlobalKey());
              return Listener(
                onPointerMove: (event) {
                  recentIndex ??= event.position.dy;
                  if (currentPosition == null) return;
                  const int timeRangeToIncreaseInMilliSecond = 120000; // 120s
                  print(currentPosition);
                  print("-----------------------------------------");

                  /// Data của item phía trên, dùng để lấy time và position
                  MockData nearestTopData = data[currentPosition! > index
                      ? currentPosition!
                      : currentPosition! - 1];

                  /// Data của item đang move
                  MockData currentData = data[index - 1];

                  /// Data của item phía dưới, dùng để lấy time và position
                  MockData nearestBottomData = data[currentPosition! >= index
                      ? currentPosition! + 1
                      : currentPosition!];

                  /// Position của item phía trên gần nhất với vị trí hiện tại
                  var nearestTopPosition = _getPosition(currentPosition! > index
                      ? currentPosition!
                      : currentPosition! - 1);

                  var currentPositionOffsetY = event.position.dy;
                  var currentOffsetPosition = _getPosition(index);

                  /// Position của item phía dưới gần nhất với vị trí hiện tại
                  var nearestBottomPositon = _getPosition(
                      currentPosition! >= index
                          ? currentPosition! + 1
                          : currentPosition!);

                  /// Khoảng cách của 2 item gần nhất với vị trí hiện tại (trên và dưới),
                  /// dùng để chia khoảng cách, từ đó tăng thời gian để thay đổi time
                  var positionRangeFromTopToBottomWidget =
                      (nearestBottomPositon - nearestTopPosition);

                  /// Khoảng cách thời gian của item gần nhất phía trên với item gần
                  /// nhất phía dưới, dùng để tiền động thời gian để thay đổi time
                  var timeRangeFromTopToBottomWidget =
                      nearestBottomData.timeStamp - nearestTopData.timeStamp;

                  /// Số lượng lần thay đổi thời gian
                  var numberOfRangeToChangeTime =
                      (timeRangeFromTopToBottomWidget /
                              timeRangeToIncreaseInMilliSecond) *
                          0.75;

                  /// Khi move một khoảng cách bằng kết quả dưới đây, thời gian
                  /// của item đang move sẽ tăng/giảm 1 lần
                  var offsetSizeLimitToIncreaseTime =
                      (positionRangeFromTopToBottomWidget /
                          numberOfRangeToChangeTime);

                  var displayTime =
                      ((currentOffsetPosition - (nearestTopPosition)) /
                              offsetSizeLimitToIncreaseTime) *
                          timeRangeToIncreaseInMilliSecond;
                  print('=====================');
                  print(nearestTopData.name);
                  print(formatDateTime(nearestTopData.timeStamp));
                  // print(currentData.name);
                  // print(nearestBottomData.name);
                  setState(() {
                    print(displayTime);
                    data[index].timeStamp =
                        nearestTopData.timeStamp + displayTime.toInt();
                    time = nearestTopData.timeStamp + displayTime.toInt();
                    // print('x-----------------------------------------x');
                    // print(data[index].timeStamp);
                    // print('====================================');
                    // print(formatDateTime(data[index].timeStamp));
                    recentIndex = currentOffsetPosition;
                  });
                },
                key: itemKeys[index],
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  tileColor: Colors.transparent,
                  leading: Text(formatTime(data[index].timeStamp)),
                  title: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: index.isOdd ? oddItemColor : evenItemColor,
                      ),
                      child: Text(data[index].name)),
                ),
              );
            }),
            onReordering: (index, dragIndex) {
              print('xxxxxxx');
              print(dragIndex);
              setState(() {
                currentPosition = dragIndex;
                oldIndexOfItem = index;
              });
            },
            onReorderEnd: (index) {
              setState(() {
                currentPosition = null;
                oldIndexOfItem = null;
              });
              setState(() {
                time = null;
              });
            },
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                data.insert(newIndex, data.removeAt(oldIndex));
              });
            },
          ),
          time != null
              ? Container(
                  alignment: Alignment.center,
                  height: 50,
                  color: Colors.transparent,
                  child: Text(
                    formatDateTime(time!),
                    style: const TextStyle(
                        fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  double _getPosition(int index) {
    RenderBox box =
        itemKeys[index].currentContext!.findRenderObject() as RenderBox;
    Offset currentPosition =
        box.localToGlobal(getListViewPosition()); //this is global position
    double height = box.size.height;

    /// move root offset match with listview offset
    double y = currentPosition.dy; //this is y
    return y + height / 2;
  }

  Offset getListViewPosition() {
    if (listViewOffset != null) return listViewOffset!;
    var box = scrollViewKey.currentContext!.findRenderObject() as RenderBox;
    listViewOffset = box.localToGlobal(const Offset(0, 0));

    return listViewOffset!;
  }

  String formatTime(int timeStamp) {
    return DateFormat('HH:mm aa')
        .format(DateTime.fromMillisecondsSinceEpoch(timeStamp));
  }

  String formatDateTime(int timeStamp) {
    return DateFormat('dd/MM/yy HH:mm aa')
        .format(DateTime.fromMillisecondsSinceEpoch(timeStamp));
  }
}
