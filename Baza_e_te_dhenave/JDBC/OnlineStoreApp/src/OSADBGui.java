import javax.swing.JOptionPane;
public class OSADBGui {
	public static void main(String args[]) {
		JDBCCommand jdbc = new JDBCCommand("jdbc:sqlserver://DESKTOP-P3BR1AD\\MSSQLSERVER01;databaseName=OnlineStoreApp;integratedSecurity=true;");
		boolean running = false;
		do {
			String komanda = JOptionPane.showInputDialog("Shtyp :\n"
														+ "1 , Per te shfaqur te dhenat e tabeles Customers,\n"
														+ "2 , Per te shfaqur te dhenat e tabeles CreditCard,\n"
														+ "3 , Per te shfaqur te dhenat e tabeles Orders,\n"
														+ "4 , Per te shfaqur te dhenat e tabeles Products,\n"
														+ "5 , Per te shfaqur te dhenat e tabeles Shippers,\n"
														+ "6 , Per te shfaqur te dhenat e tabeles TN1,\n"
														+ "7 , Per te egzekutuar nje query specifik,\n"
														+ "8 , Per te perfunduar programin : ");
			if(komanda.equalsIgnoreCase("1")) {
				JOptionPane.showMessageDialog(null, jdbc.tableRezult("SELECT * FROM Customers;"));
				running = true;
			}
			else if(komanda.equalsIgnoreCase("2")) {
				JOptionPane.showMessageDialog(null, jdbc.tableRezult("SELECT * FROM CreditCard;"));
				running = true;
			}
			else if(komanda.equalsIgnoreCase("3")) {
				JOptionPane.showMessageDialog(null, jdbc.tableRezult("SELECT * FROM Orders;"));
				running = true;
			}
			else if(komanda.equalsIgnoreCase("4")) {
				JOptionPane.showMessageDialog(null, jdbc.tableRezult("SELECT * FROM Products;"));
				running = true;
			}
			else if(komanda.equalsIgnoreCase("5")) {
				JOptionPane.showMessageDialog(null, jdbc.tableRezult("SELECT * FROM Shippers;"));
				running = true;
			}
			else if(komanda.equalsIgnoreCase("6")) {
				JOptionPane.showMessageDialog(null, jdbc.tableRezult("SELECT * FROM TN1;"));
				running = true;
			}
			else if(komanda.equalsIgnoreCase("7")) {
				String SQL = JOptionPane.showInputDialog("Shtypni query-n :");
				JOptionPane.showMessageDialog(null, jdbc.tableRezult(SQL));
				running = true;
			}
			else if(komanda.equalsIgnoreCase("8")) {
				JOptionPane.showMessageDialog(null, "Ju keni perfunduar programin !");
				running = false;
			}
			else {
				JOptionPane.showMessageDialog(null, "Ju keni shtypur inputin gabim !");
				running = true;
			}
		}
		while(running);
		jdbc.close();
	}
}
