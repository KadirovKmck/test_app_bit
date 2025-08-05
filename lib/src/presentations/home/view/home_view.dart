import 'dart:math';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_app/src/components/custom_scaffold.dart';
import 'package:test_app/src/logic/logix.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CryptoModel> _cryptos = [];
  final ApiService _api = ApiService();
  final ScrollController _controller = ScrollController();

  int _offset = 0;
  final int _limit = 15;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent &&
        !_isLoading) {
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    setState(() => _isLoading = true);
    final result = await _api.fetchAssets(_limit, _offset);
    setState(() {
      _offset += _limit;
      _cryptos.addAll(result);
      _isLoading = false;
    });
  }

  Color _generateRandomColor(int index) {
    final rng = Random(index);
    return Color.fromARGB(
      255,
      rng.nextInt(256),
      rng.nextInt(256),
      rng.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      top: false,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 6.h),
              controller: _controller,
              itemCount: _cryptos.length,
              itemBuilder: (context, index) {
                final crypto = _cryptos[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Opacity(
                            opacity: 0.10,
                            child: Container(
                              width: 12.8.w,
                              height: 12.8.w,
                              decoration: BoxDecoration(
                                color: _generateRandomColor(index),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            crypto.symbol,
                            style: TextStyle(
                              color: const Color(0xFF17171A),
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.41,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$${crypto.priceUsd.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: const Color(0xFF17171A),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.41,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
