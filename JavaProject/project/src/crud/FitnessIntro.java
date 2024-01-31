package crud;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.border.LineBorder;

public class FitnessIntro extends JFrame implements ActionListener {
	Container container;
	JLabel introLabel;
	JButton introBtn;

	private Image introBg = new ImageIcon(FitnessIntro.class.getResource("../img/fitness_intro.jpg")).getImage();// 배경이미지

	public FitnessIntro(String title) {
		super(title);
		container = this.getContentPane();
		setSize(900, 600);
		setResizable(false);
		setLocationRelativeTo(null);
//		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		design();
		this.setVisible(true);

	}

	// 디자인
	public void design() {
//		setLocationRelativeTo(null);
//		introLabel.setSize(900, 600);

//		introLabel = new JLabel("화이트 피트니스 센터");
//		introLabel.setBorder(new LineBorder(Color.pink));
//		introLabel.setBounds(20, 120, 300, 30);
//		this.add(introLabel);

		this.setLayout(null);
		introBtn = new JButton("회원 관리 접속");
		introBtn.setBounds(370, 300, 160, 60);
		introBtn.setBackground(new Color(206, 208, 216));
		introBtn.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		this.add(introBtn);

	}


	// 액션
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub

	}

	// 배경이미지
	public void paint(Graphics g) {
		g.drawImage(introBg, 0, 0, getWidth(), getHeight(), this);
	}

	public static void main(String[] args) {
		new FitnessIntro("화이트 피트니스 센터");

	}

}
