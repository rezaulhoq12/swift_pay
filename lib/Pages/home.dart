import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('SwiftPay Dashboard'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Balance Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Available Balance',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '৳4,750.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Dashboard Grid
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildTile(
                  icon: Icons.send,
                  label: 'Send Money',
                  color: Colors.blue,
                  onTap: () {
                    // Add navigation or logic
                  },
                ),
                _buildTile(
                  icon: Icons.history,
                  label: 'Transactions',
                  color: Colors.green,
                  onTap: () {
                    Navigator.pushNamed(context, '/transactions');
                  },
                ),
                _buildTile(
                  icon: Icons.account_balance_wallet,
                  label: 'Wallet',
                  color: Colors.orange,
                  onTap: () {
                    // Add navigation or logic
                  },
                ),
                _buildTile(
                  icon: Icons.settings,
                  label: 'Settings',
                  color: Colors.purple,
                  onTap: () {
                    // Add navigation or logic
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Transaction History Section
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Recent Transactions',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            const SizedBox(height: 16),
            _buildTransactionTile(
              title: 'Sent to John',
              amount: '-৳250.00',
              date: 'Apr 15, 2025',
              isCredit: false,
            ),
            _buildTransactionTile(
              title: 'Received from Alice',
              amount: '+৳500.00',
              date: 'Apr 13, 2025',
              isCredit: true,
            ),
            _buildTransactionTile(
              title: 'Wallet Top-up',
              amount: '+৳1,000.00',
              date: 'Apr 10, 2025',
              isCredit: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                color: color.withOpacity(0.9), // Fixed here
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionTile({
    required String title,
    required String amount,
    required String date,
    required bool isCredit,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          isCredit ? Icons.arrow_downward : Icons.arrow_upward,
          color: isCredit ? Colors.green : Colors.red,
        ),
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: TextStyle(
            color: isCredit ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
