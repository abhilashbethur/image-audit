# 🧹 image-sweep

> A simple Bash script to detect unused image assets in your JavaScript/TypeScript project.

**image-sweep** helps you keep your repository clean by scanning for image files (e.g., `.png`, `.jpg`, `.svg`) that are not referenced anywhere in your source code. This is especially useful in large frontend projects where old assets are often left behind and forgotten.

---

## 📂 What It Does

- Scans your `src/` directory for all image files
- Creates a snapshot of all code content from relevant file types
- Checks each image file to see if it’s referenced anywhere
- Outputs a list of unused images in a `unused-images.txt` file

---

## 🛠️ Installation

Clone the repository and make the script executable:

```bash
git clone https://github.com/yourusername/image-sweep.git
cd image-sweep
chmod +x image-sweep.sh
```

✅ Ensure your project follows a standard structure with a /src folder. You can modify the SRC_DIR in the script if your code lives elsewhere.

🚀 Usage

In the project root, run:
```bash
./image-sweep.sh
```
After execution, you’ll see:
	•	A full code snapshot in all-code.txt
	•	A list of unused image files in unused-images.txt

 ------

 📦 File Types Scanned

✅ Code Files:
	•	.js
	•	.jsx
	•	.ts
	•	.tsx
	•	.mdx
	•	.css
	•	.scss
	•	.json
	•	.html

🎯 Image Extensions:
	•	.png
	•	.jpg
	•	.jpeg
	•	.svg

 📄 Example Output
 ```bash
🔍 Starting unused image scan...
📄 Creating code snapshot...
[1] Checking image: logo-old.png
❌ Unused image: src/assets/images/logo-old.png
[2] Checking image: icon-check.svg
✅ Used image: icon-check.svg

✅ Scan complete. Total images checked: 2
🗑️  Unused images found: 1
📁 Results saved to: unused-images.txt
```
----

🙋‍♂️ Why Use This?
	•	Reduce bundle size
	•	Clean up old assets
	•	Keep your repo organized and efficient

 ---

🧠 Improvements (TODO)
	•	Add config options (e.g., exclude folders, custom extensions)
	•	Integrate with CI/CD
	•	Support image usage in inline base64 formats
 
---

📜 License

MIT License — feel free to use, modify, and contribute.

---

🤝 Contributions

Pull requests are welcome! If you find any bugs or have feature ideas, feel free to open an issue.
Let me know if you'd like to turn this into a GitHub template repo or add badges/branding!






