SELECT user_id ,name, mail 
FROM Users 
WHERE mail ~'^[a-zA-Z][a-zA-Z0-9_./-]*@leetcode\.com$'
前缀 名称是一个字符串，可以包含字母（大写或小写），数字，下划线 '_' ，点 '.' 和/或破折号 '-' 。前缀名称 必须 以字母开头。
域 为 '@leetcode.com' 。