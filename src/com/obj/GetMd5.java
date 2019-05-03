package com.obj;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class GetMd5 {
    public static String getMD5(String info) {
        try {
            //��ȡ MessageDigest ���󣬲���Ϊ MD5 �ַ�������ʾ����һ�� MD5 �㷨���������� SHA1 �㷨�ȣ���
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            //update(byte[])����������ԭ����
            //����StringBuilder�����append()������׷��ģʽ������һ���ۼƸ��ĵĹ���
            md5.update(info.getBytes("UTF-8"));
            //digest()�����ú�,MessageDigest����ͱ����ã������������ٴε��ø÷�������ԭ���ݵ�MD5ֵ�������ֶ�����reset()������������Դ��
            //digest()����ֵ16λ���ȵĹ�ϣֵ����byte[]�н�
            byte[] md5Array = md5.digest();
            //byte[]ͨ�����ǻ�ת��Ϊʮ�����Ƶ�32λ���ȵ��ַ�����ʹ��,���Ļ�������ֳ��õ�ת������
            return bytesToHex1(md5Array);
        } catch (NoSuchAlgorithmException e) {
            return "";
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }
    public static String getMD5A(String info) {
        try {
            //��ȡ MessageDigest ���󣬲���Ϊ MD5 �ַ�������ʾ����һ�� MD5 �㷨���������� SHA1 �㷨�ȣ���
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            //update(byte[])����������ԭ����
            //����StringBuilder�����append()������׷��ģʽ������һ���ۼƸ��ĵĹ���
            md5.update(info.getBytes("UTF-8"));
            //digest()�����ú�,MessageDigest����ͱ����ã������������ٴε��ø÷�������ԭ���ݵ�MD5ֵ�������ֶ�����reset()������������Դ��
            //digest()����ֵ16λ���ȵĹ�ϣֵ����byte[]�н�
            byte[] md5Array = md5.digest();
            //byte[]ͨ�����ǻ�ת��Ϊʮ�����Ƶ�32λ���ȵ��ַ�����ʹ��,���Ļ�������ֳ��õ�ת������
            return bytesToHex2(md5Array);
        } catch (NoSuchAlgorithmException e) {
            return "";
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }
    public static String getMD5B(String info) {
        try {
            //��ȡ MessageDigest ���󣬲���Ϊ MD5 �ַ�������ʾ����һ�� MD5 �㷨���������� SHA1 �㷨�ȣ���
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            //update(byte[])����������ԭ����
            //����StringBuilder�����append()������׷��ģʽ������һ���ۼƸ��ĵĹ���
            md5.update(info.getBytes("UTF-8"));
            //digest()�����ú�,MessageDigest����ͱ����ã������������ٴε��ø÷�������ԭ���ݵ�MD5ֵ�������ֶ�����reset()������������Դ��
            //digest()����ֵ16λ���ȵĹ�ϣֵ����byte[]�н�
            byte[] md5Array = md5.digest();
            //byte[]ͨ�����ǻ�ת��Ϊʮ�����Ƶ�32λ���ȵ��ַ�����ʹ��,���Ļ�������ֳ��õ�ת������
            return bytesToHex3(md5Array);
        } catch (NoSuchAlgorithmException e) {
            return "";
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }

    private static String bytesToHex1(byte[] md5Array) {
        StringBuilder strBuilder = new StringBuilder();
        for (int i = 0; i < md5Array.length; i++) {
            int temp = 0xff & md5Array[i];//TODO:�˴�Ϊʲô��� 0xff & ��
            String hexString = Integer.toHexString(temp);
            if (hexString.length() == 1) {//�����ʮ�����Ƶ�0f��Ĭ��ֻ��ʾf����ʱҪ����0
                strBuilder.append("0").append(hexString);
            } else {
                strBuilder.append(hexString);
            }
        }
        return strBuilder.toString();
    }

    //ͨ��java�ṩ��BigInteger ���byte->HexString
    private static String bytesToHex2(byte[] md5Array) {
        BigInteger bigInt = new BigInteger(1, md5Array);
        return bigInt.toString(16);
    }

    //ͨ��λ���� ���ֽ����鵽ʮ�����Ƶ�ת��
    private static String bytesToHex3(byte[] byteArray) {
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        char[] resultCharArray = new char[byteArray.length * 2];
        int index = 0;
        for (byte b : byteArray) {
            resultCharArray[index++] = hexDigits[b >>> 4 & 0xf];
            resultCharArray[index++] = hexDigits[b & 0xf];
        }
        return new String(resultCharArray);
    }
}
