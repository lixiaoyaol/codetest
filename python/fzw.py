

import time
import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from bs4 import BeautifulSoup

# 创建一个 WebDriver 实例
driver = webdriver.Chrome(executable_path='path_to_chromedriver')  # 修改为你自己的 ChromeDriver 路径

# 书籍的 URL
book_url = "https://product.dangdang.com/xxx.html"  # 将这个替换为你目标书籍的 URL

# 打开网页
driver.get(book_url)

# 等待网页加载
time.sleep(5)  # 可以根据页面加载时间调整

# 滚动页面，确保加载更多评论
for _ in range(10):  # 向下滚动10次，加载更多评论
    driver.execute_script("window.scrollBy(0, 1000);")
    time.sleep(2)

# 获取页面的 HTML 内容
html = driver.page_source

# 使用 BeautifulSoup 解析 HTML
soup = BeautifulSoup(html, 'html.parser')

# 提取评论内容
comments = []
for comment_section in soup.find_all('div', class_='comment-item'):
    try:
        # 获取评论的文本内容
        comment_text = comment_section.find('div', class_='comment-txt').text.strip()
        comments.append(comment_text)
    except AttributeError:
        continue

# 如果有多页评论，可能需要遍历页面进行抓取
# 例如：分页逻辑可以使用 selenium 继续点击“下一页”按钮并重复上述步骤。

# 输出评论数量
print(f"Total comments found: {len(comments)}")

# 将评论保存到 DataFrame 或 CSV
df = pd.DataFrame(comments, columns=["Comment"])
df.to_csv("book_comments.csv", index=False, encoding="utf-8")

# 关闭浏览器
driver.quit()
