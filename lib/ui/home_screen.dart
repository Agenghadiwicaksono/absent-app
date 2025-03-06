import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:students_attendance_with_mlkit/ui/absent/absent_screen.dart';
import 'package:students_attendance_with_mlkit/ui/attend/attend_screen.dart';
import 'package:students_attendance_with_mlkit/ui/attendence_histhory/attendance_histhory_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _onwillPop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Absensi Kehadiran',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.lightBlueAccent,
                    width: 10
                  )
                ),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AttendScreen()),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_absen.png',
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Absen Kehadiran",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.lightBlueAccent,
                    width: 10
                  )
                ),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AbsentScreen(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_leave.png',
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Cuti / Izin",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.lightBlueAccent,
                    width: 10
                  )
                ),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceHistoryScreen(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_history.png',
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Riwayat Absensi",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future<bool> _onwillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "INFO",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Do you want to exit the app?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  "No",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ) ??
        false);
  }
}