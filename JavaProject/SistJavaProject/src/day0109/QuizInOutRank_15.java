package day0109;

public class QuizInOutRank_15 {

	public static void main(String[] args) {
		String[] name = { "홍수연", "김수연", "최수연", "민수연" };
		int[] kor = { 90, 88, 100, 78 };
		int[] eng = { 100, 55, 100, 87 };
		int[] mat = { 44, 55, 100, 66 };
		int[] tot = new int[4];
		double[] avg = new double[4];
		int[] rank = new int[4];
		int[] num = new int[4];

		/*
		 * 각 학생들의 점수에 대한 총점 평균 등수를 구하여 출력하세요
		 * 
		 * 번호 이름 국어 영어 수학 총점 평균 등수 ================================= 1 홍수연 90 100 44 **
		 * ** 4
		 */

		// 1.총점 평균 ..배열
		for (int a = 0; a < name.length; a++) {

			tot[a] += kor[a] + eng[a] + mat[a];
			avg[a] = (kor[a] + eng[a] + mat[a]) / name.length;
			num[a] += name.length;

		}

		// 등수

		for (int i = 0; i < name.length; i++) {
			rank[i] = 1;
			for (int j = 0; j < name.length; j++) {
				// 비교되는 대상이 점수가 더 높으면 i번지의 등수를 1증가시킨다
				if (avg[i] < avg[j]) {
					rank[i]++;
				}
			}
		}

		// 출력
		System.out.print("번호\t  이름\t  국어\t  영어\t  수학\t  총점\t  평균\t  등수\n");
		System.out.print("==================================\n");
		for (int i = 0; i < name.length; i++) {
			System.out.println(i + 1 + "\t" + name[i] + "\t" + kor[i] + "\t" + eng[i] + "\t" + mat[i] + "\t" + tot[i] + "\t" + rank[i]);
		}

	}

}
