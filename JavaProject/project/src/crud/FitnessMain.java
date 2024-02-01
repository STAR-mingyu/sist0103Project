package crud;


import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class FitnessMain extends JFrame implements ActionListener {

	Container container;
	JPanel mainPanel, bottomPanel;
	JButton insertBtn, updateBtn, deleteBtn;
	JLabel btnLabel1, btnLabel2, inputLabel1, inputLabel2, inputLabel3, inputLabel4, correctionTitle, correctionTitle2,
			correctionTitle3;
	JTextField inputText1, inputText2, inputText3, inputText4;
	JComboBox<String> program;

	DefaultTableModel model;
	JTable table;

	FitnessDbConn db = new FitnessDbConn();

	public FitnessMain(String title) {
		super(title);
		container = this.getContentPane();
		setSize(1000, 800);
		container.setBackground(new Color(209, 215, 215));
		setResizable(false);
		setLocationRelativeTo(null);
//		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		design();
		this.setVisible(true);
	}

	// 조회
	public void check() {

		model.setRowCount(0);

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getOracle();

		String sql = "select * from fitness order by no";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Vector<String> data = new Vector<String>();
				data.add(rs.getString("no"));
				data.add(rs.getString("name"));
				data.add(rs.getString("gender"));
				data.add(rs.getString("age"));
				data.add(rs.getString("tel"));
				data.add(rs.getString("program"));
				data.add(rs.getString("joinDate"));

				model.addRow(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	// 디자인
	public void design() {

		String[] title = { "No", "회원명", "성별", "나이", "전화번호", "프로그램", "가입 날짜" };
		model = new DefaultTableModel(title, 0);
		table = new JTable(model);
		this.add("Center", new JScrollPane(table));

		check();
		
		
		table.setBackground(new Color(229,229,229)); // 셀 배경색 변경
		table.setGridColor(new Color(189,189,189));	// 셀 테두리색 변경
		table.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
		table.setForeground(Color.black); // 셀 글자색 변경


		JPanel mainPanel = new JPanel();
		this.add("North", mainPanel);
		mainPanel.setBackground(new Color(209, 215, 215));

		
		JPanel bottomPanel = new JPanel();
		this.add("South", bottomPanel);
		bottomPanel.setBackground(new Color(253, 244, 251));

		correctionTitle = new JLabel("추가&수정");
		correctionTitle.setFont(new Font("맑은 고딕", Font.BOLD, 18));
		bottomPanel.add(correctionTitle);

		correctionTitle2 = new JLabel("               ");
		bottomPanel.add(correctionTitle2);

		inputLabel1 = new JLabel("이름");
		inputLabel1.setFont(new Font("맑은 고딕", Font.PLAIN, 16));
		bottomPanel.add(inputLabel1);

		inputText1 = new JTextField();
		inputText1.setPreferredSize(new Dimension(80, 24));
		bottomPanel.add(inputText1);

		inputLabel2 = new JLabel("성별");
		inputLabel2.setFont(new Font("맑은 고딕", Font.PLAIN, 16));
		bottomPanel.add(inputLabel2);

		inputText2 = new JTextField();
		inputText2.setPreferredSize(new Dimension(80, 24));
		bottomPanel.add(inputText2);

		inputLabel3 = new JLabel("나이");
		inputLabel3.setFont(new Font("맑은 고딕", Font.PLAIN, 16));
		bottomPanel.add(inputLabel3);

		inputText3 = new JTextField();
		inputText3.setPreferredSize(new Dimension(80, 24));
		bottomPanel.add(inputText3);

		inputLabel4 = new JLabel("전화번호");
		inputLabel4.setFont(new Font("맑은 고딕", Font.PLAIN, 16));
		bottomPanel.add(inputLabel4);

		inputText4 = new JTextField();
		inputText4.setPreferredSize(new Dimension(80, 24));
		bottomPanel.add(inputText4);

		correctionTitle3 = new JLabel("               ");
		bottomPanel.add(correctionTitle3);

		String[] programArr = { "PT", "PILATES", "GOLF", "GROUP EXERCISE" };
		program = new JComboBox<String>(programArr);
		bottomPanel.add(program);

		insertBtn = new JButton("추가하기");
		insertBtn.addActionListener(this);
		insertBtn.setBackground(Color.white);
		insertBtn.setPreferredSize(new Dimension(140, 60));
		insertBtn.setFont(new Font("맑은 고딕", Font.BOLD, 22));
		mainPanel.add(insertBtn);

		btnLabel1 = new JLabel("      ");

		mainPanel.add(btnLabel1);

		updateBtn = new JButton("수정하기");
		updateBtn.addActionListener(this);
		updateBtn.setBackground(Color.white);
		updateBtn.setPreferredSize(new Dimension(140, 60));
		updateBtn.setFont(new Font("맑은 고딕", Font.BOLD, 22));
		mainPanel.add(updateBtn);

		btnLabel2 = new JLabel("      ");
		mainPanel.add(btnLabel2);

		deleteBtn = new JButton("삭제하기");
		deleteBtn.addActionListener(this);
		deleteBtn.setBackground(Color.white);
		deleteBtn.setPreferredSize(new Dimension(140, 60));
		deleteBtn.setFont(new Font("맑은 고딕", Font.BOLD, 22));
		mainPanel.add(deleteBtn);
	}

	// 추가
	public void insert() {
		String name = inputText1.getText();
		String gender = inputText2.getText();
		String age = inputText3.getText();
		String tel = inputText4.getText();
		String insertprogram = (String) program.getSelectedItem();

		String sql = "insert into fitness values(seq_fitness.nextval,?,?,?,?,?,sysdate)";

		Connection conn = db.getOracle();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setString(3, age);
			pstmt.setString(4, tel);
			pstmt.setString(5, insertprogram);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	// 수정
	public void correction(String no) {
		String name = inputText1.getText();
		String gender = inputText2.getText();
		String age = inputText3.getText();
		String tel = inputText4.getText();
		String insertprogram = (String) program.getSelectedItem();

		String sql = "update fitness set name=?,gender=?,age=?,tel=?,program=? where no =" + no;

		Connection conn = db.getOracle();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setString(3, age);
			pstmt.setString(4, tel);
			pstmt.setString(5, insertprogram);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	// 삭제
	public void delete(String no) {
		String sql = "delete from fitness where no = " + no;
		Connection conn = db.getOracle();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			int a = pstmt.executeUpdate();
			if (a == 1) {
				check();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 수정하기
	public void update() {

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob = e.getSource();

		if (ob == insertBtn) {

			insert();
			check();

		} else if (ob == deleteBtn) {
			String no = JOptionPane.showInputDialog("삭제할 회원은?");
			delete(no);
		} else if (ob == updateBtn) {
			String no = JOptionPane.showInputDialog("수정할 회원은?");
			correction(no);
			check();
		}
//			correction
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new FitnessMain("화이트 피트니스 센터");

	}

}
