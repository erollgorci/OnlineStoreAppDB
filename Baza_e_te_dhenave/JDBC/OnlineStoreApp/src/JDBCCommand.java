import java.sql.*;
public class JDBCCommand {
	public Connection con = null;
	public Statement stmt = null;
	public ResultSet rs = null;
	public JDBCCommand(String connectionUrl) {
		try {
    		// Establish the connection.
    		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        	con = DriverManager.getConnection(connectionUrl);
        
        		// Create and execute an SQL statement that returns some data.
        		
    	}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String tableRezult(String SQL) {
		String rez = "";
		try {
		stmt = con.createStatement();
		rs = stmt.executeQuery(SQL);
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnsNumber = rsmd.getColumnCount();
		// Iterate through the data in the result set and display it.
		rez = rez + " | ";
		for(int i = 1; i <= columnsNumber; i++) {
			rez = rez + rsmd.getColumnName(i)+ " | ";
		}
		rez = rez + "\n";
		while (rs.next()) {
			rez = rez + " | ";
			for(int i = 1 ; i != columnsNumber+1 ; i++) {
			if(rs.getString(i) != null) rez = rez  + rs.getString(i).trim() + " | " ;
			else rez = rez  + rs.getString(i) + " | " ;
			}
			rez = rez + "\n";
		}
		}
		catch (Exception e) {
			e.printStackTrace();
			rez = "Keni shtypur query-n gabim,Provoni perseri!";
		}
		return rez;
	}
	
	public void close() {
		if (rs != null) try { rs.close(); } catch(Exception e) {}
		if (stmt != null) try { stmt.close(); } catch(Exception e) {}
		if (con != null) try { con.close(); } catch(Exception e) {}
	}


}
