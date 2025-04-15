import yfinance as yf
from datetime import datetime, timedelta

# Function to fetch hourly stock data for a given symbol
def fetch_hourly_stock_data(symbol: str):
    end_date = datetime.today().date()
    start_date = end_date - timedelta(days=30)

    try:
        ticker = yf.Ticker(symbol)
        hist = ticker.history(start=start_date.isoformat(),
                              end=end_date.isoformat(),
                              interval="60m",
                              actions=False)

        if hist.empty:
            print(f"No data found for {symbol}")
            return []

        hist = hist.between_time("09:30", "16:00")  # Keep only market hours
        hist.reset_index(inplace=True)

        print(f"Hourly data for {symbol}:")
        for _, row in hist.iterrows():
            print(f"Datetime: {row['Datetime']}, Open: {row['Open']}, High: {row['High']}, Low: {row['Low']}, Close: {row['Close']}, Volume: {row['Volume']}")

        return hist
    except Exception as e:
        print(f"Error fetching stock data for {symbol}: {str(e)}")
        return []

# Test the function for a specific stock symbol
symbol = "AAPL"  # Example: Apple
fetch_hourly_stock_data(symbol)
