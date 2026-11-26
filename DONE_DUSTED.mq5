
void OnTick()
{
   static datetime lastBar = 0;

   datetime currentBar = iTime(_Symbol, TimeFrame, 0);

   if(currentBar == lastBar || currentBar == 0)
      return;

   lastBar = currentBar;

   double ema50[2], ema200[2];
   double rsi[2], macdMain[2], macdSignal[2];

   ArraySetAsSeries(ema50, true);
   ArraySetAsSeries(ema200, true);
   ArraySetAsSeries(rsi, true);
   ArraySetAsSeries(macdMain, true);
   ArraySetAsSeries(macdSignal, true);

   if(CopyBuffer(fastHandle, 0, 0, 2, ema50) != 2)
      return;

   if(CopyBuffer(slowHandle, 0, 0, 2, ema200) != 2)
      return;

   if(CopyBuffer(rsiHandle, 0, 0, 2, rsi) != 2)
      return;

   if(CopyBuffer(macdHandle, 0, 0, 2, macdMain) != 2)
      return;

   if(CopyBuffer(macdHandle, 1, 0, 2, macdSignal) != 2)
      return;

   // Use the last completed candle
   bool buySignal =
      ema50[1] > ema200[1] &&
      rsi[1] > 50 && rsi[1] < 70 &&
      macdMain[1] > macdSignal[1];

   bool sellSignal =
      ema50[1] < ema200[1] &&
      rsi[1] < 50 && rsi[1] > 30 &&
      macdMain[1] < macdSignal[1];

   if(buySignal)
      Print("DONE & DUSTED: BUY SIGNAL on ", _Symbol);

   if(sellSignal)
      Print("DONE & DUSTED: SELL SIGNAL on ", _Symbol);
}

//+------------------------------------------------------------------+
//|                  DONE & DUSTED                                   |
//|                  MT5 Expert Advisor                              |
//+------------------------------------------------------------------+
#property strict
#property version "1.00"

#include <Trade/Trade.mqh>
CTrade trade;

// Risk management
input double RiskPercent = 0.5;
input double MaxDailyLossPercent = 2.0;

// Strategy settings
input int FastEMA = 50;
input int SlowEMA = 200;
input int RSIPeriod = 14;
input int MACDFast = 12;
input int MACDSlow = 26;
input int MACDSignal = 9;

input ENUM_TIMEFRAMES TimeFrame = PERIOD_M5;

// Indicator handles
int fastHandle;
int slowHandle;
int rsiHandle;
int macdHandle;

double startingBalance;
int tradingDay;

//+------------------------------------------------------------------+
int OnInit()
{
   fastHandle = iMA(_Symbol, TimeFrame, FastEMA,
                    0, MODE_EMA, PRICE_CLOSE);

   slowHandle = iMA(_Symbol, TimeFrame, SlowEMA,
                    0, MODE_EMA, PRICE_CLOSE);

   rsiHandle = iRSI(_Symbol, TimeFrame,
                    RSIPeriod, PRICE_CLOSE);

   macdHandle = iMACD(_Symbol, TimeFrame,
                      MACDFast, MACDSlow,
                      MACDSignal, PRICE_CLOSE);

   if(fastHandle == INVALID_HANDLE ||
      slowHandle == INVALID_HANDLE ||
      rsiHandle == INVALID_HANDLE ||
      macdHandle == INVALID_HANDLE)
      return INIT_FAILED;

   startingBalance = AccountInfoDouble(ACCOUNT_BALANCE);
   tradingDay = -1;

   trade.SetExpertMagicNumber(26112026);

   Print("DONE & DUSTED initialized successfully");

   return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(fastHandle);
   IndicatorRelease(slowHandle);
   IndicatorRelease(rsiHandle);
   IndicatorRelease(macdHandle);
}

//+------------------------------------------------------------------+
void OnTick()
{
   // Analysis and execution will be added
   // after indicator and risk-management testing.
}
