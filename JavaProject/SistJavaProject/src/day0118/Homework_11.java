package day0118;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Homework_11 extends JFrame implements ActionListener {

	Container cp;
	JButton[] btn = new JButton[5];
	String[] btnlabel = { "red", "blud", "black", "green", "orange" };
//	JButton btn1, btn2, btn3, btn4, btn5;
	Color[] color = { Color.red, Color.blue, Color.black, Color.green, Color.orange };
    JLabel mainlabel;
	public Homework_11() {
		// TODO Auto-generated constructor stub
		super("배열");

		cp = this.getContentPane();
		this.setBounds(300, 100, 600, 300);
		cp.setBackground(new Color(255, 255, 200));

		initDesign();
		this.setVisible(true);
	}

	public void initDesign() {
		JPanel panel = new JPanel();
		panel.setBackground(Color.red);
		this.add(panel, BorderLayout.NORTH);

		for (int i = 0; i < btn.length; i++) {
			btn[i] = new JButton(btnlabel[i]);
			btn[i].setBackground((color[i]));
			panel.add(btn[i]);
			btn[i].addActionListener(this);
		}
		
		mainlabel = new JLabel("안녕하세요");
//		mainlabel.setBounds();
		this.add(mainlabel);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob = e.getSource();
		

	}

	public static void main(String[] args) {

		new Homework_11();
	}

}
