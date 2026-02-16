<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MedicPedia – Medicine Information System</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* ── Header ─────────────────────────────────────────── */
        .header {
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            padding: 18px 30px;
            text-align: center;
            font-size: 24px;
            font-weight: 700;
            color: #2c3e50;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            letter-spacing: 0.5px;
        }

        .header span {
            color: #1abc9c;
        }

        /* ── Search Container ───────────────────────────────── */
        .search-container {
            margin-top: 100px;
            width: 460px;
            max-width: 90%;
            background: rgba(255, 255, 255, 0.97);
            padding: 40px 35px;
            border-radius: 18px;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.25);
            text-align: center;
            animation: slideUp 0.6s ease;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .search-container h2 {
            font-size: 22px;
            color: #2c3e50;
            margin-bottom: 6px;
        }

        .search-container .subtitle {
            font-size: 13px;
            color: #999;
            margin-bottom: 25px;
        }

        .search-container input[type=text] {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .search-container input[type=text]:focus {
            border-color: #1abc9c;
            box-shadow: 0 0 0 4px rgba(26, 188, 156, 0.15);
        }

        .search-container button {
            margin-top: 18px;
            width: 100%;
            padding: 14px;
            border: none;
            background: linear-gradient(135deg, #1abc9c, #16a085);
            color: white;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(26, 188, 156, 0.3);
        }

        .search-container button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(26, 188, 156, 0.4);
        }

        .search-container button:active {
            transform: translateY(0);
        }

        /* ── Hints ──────────────────────────────────────────── */
        .hints {
            margin-top: 20px;
            font-size: 12px;
            color: #aaa;
            line-height: 1.6;
        }

        .hints strong {
            color: #777;
        }

        /* ── Footer ─────────────────────────────────────────── */
        .footer {
            margin-top: auto;
            padding: 20px;
            color: rgba(255, 255, 255, 0.3);
            font-size: 12px;
        }
    </style>
</head>

<body>

    <div class="header">
        🏥 Medic<span>Pedia</span>
    </div>

    <div class="search-container">
        <h2>🔍 Search Medicine</h2>
        <p class="subtitle">Search by full or partial medicine name</p>

        <form action="searchMedicine" method="get">
            <input type="text" name="medicineName" placeholder="e.g. Paracetamol, ibu, met..." required
                autocomplete="off">
            <button type="submit">Search</button>
        </form>

        <div class="hints">
            <strong>Tip:</strong> You can type partial names — searching "met"
            will show Metformin, Metoprolol, Metronidazole, etc.
        </div>
    </div>

    <div class="footer">
        MedicPedia &copy; 2026 — Medicine Information System
    </div>

</body>

</html>