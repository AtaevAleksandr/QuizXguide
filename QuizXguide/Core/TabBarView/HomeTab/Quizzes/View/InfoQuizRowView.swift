//
//  InfoQuizRowView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 02.03.2024.
//

import SwiftUI

struct InfoQuizRowView: View {

    let quizModel: InfoQuizModel

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                AppBackgroundView()

                ScrollView {
                    VStack {
                        Text(quizModel.infoText)
                            .font(.headline)
                        .foregroundStyle(.white)
                    }
                    .padding()
                }


            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                title
                dismissButton
            }
        }
        .navigationViewStyle(.stack)
    }
}

//MARK: EXTENSION
extension InfoQuizRowView {
    private var title: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text(quizModel.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
        }
    }

    private var dismissButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.white)

            }
        }
    }
}

#Preview {
    InfoQuizRowView(quizModel: InfoQuizModel(title: "WHAT IS THE FOREX?", infoText: "What Is “Forex”? /n/n“Forex” is the abbreviation most used today for “foreign exchange,” meaning the price of one currency in terms of another currency. By definition, all Forex prices refer to the relationship between two currencies, i.e., a pair of currencies. /n/nThe term “Forex” is used interchangeably with the term “FX.” Both are used today, and both refer to the same thing - foreign exchange. The term “FX” is mostly used in the US, while “Forex” was more broadly used in the UK until recently. Professional traders in the US at banks and brokers tend to use the term “FX”, while “Forex” is the term used in the retail market, adopted from British usage. Also used is the word “currency,” as in “I trade currencies” or “something happened in the currency market.” /n/nForeign exchange refers literally to money, or more accurately, to money in two different denominations. The “exchange” part of the term means giving one thing of monetary value in return for a different thing of equivalent value. The word exchange refers to the transaction in which each of the two parties is willing to exchange their respective basket of money for the equivalent amount of money denominated in the second currency. The price at which the two parties are willing to make the exchange is the exchange rate. /n/nThe price of one currency in terms of another currency is called a “rate” and not a “price.” Although in practice, the word “price” is often used as a replacement for the word “rate“, it is not technically accurate. Foreign exchange is the only market in which the word rate is used in place of the word price. The reason for this usage is probably due to the word “rate” being used since the Middle Ages to refer to a tariff or tax levy since converting one currency to another entails applying a ratio or a proportion to one currency relative to the other. A common Latin phrase is “pro rata” from “pro rata parte,” meaning “in proportion.” The word “rate” in English comes from the Latin “rata.” /n/nWhat Is Being Exchanged? /n/nSince foreign exchange refers to two baskets of money, each with its own denomination, a foreign exchange transaction can be as simple as buying a basket of 165 dollars in return for £100 at an airport kiosk. The exchange rate is $1.65 per UK pound sterling. /n/nWhy is the exchange rate not £0.6061 per dollar? This is the same exchange rate, just expressed differently (it is the reciprocal, or 1 divided by 1.65). The answer lies in the historical convention of quoting the price of other currencies in terms of what they cost in pounds. The pound sterling was the benchmark currency for centuries until just after World War II, meaning the central currency against which all other currencies were judged and priced. /n/nAfter World War II, the US dollar was declared the benchmark currency by the Bretton Woods Agreement of the 44 allied countries, and most other currencies were priced in terms of how many units of foreign currency you could get for one dollar. /n/nAs a rule, any money not issued by your home government is “foreign.” The natural way to look at foreign exchange is to ask: “How many units of foreign currency can I get for a fixed amount of my home currency?” This is how a tourist or an importer looks at foreign exchange. But because the dollar is currently the benchmark currency against which almost all others are priced, the dollar comes first in the name of many currency pairs, although not all. The first name in a currency pair is generally the important name, and the second is the secondary or less important one. /n/nPutting a name first is to assume that the fixed amount is denominated in that currency and the variable amount will be the other currency. In other words, the first currency is the base, and you are applying a ratio to derive the price of the second currency. When the European Monetary Union decided to quote the euro in the format “Euro/USD” and “Euro/JPY,” etc., it was a deliberate choice to make the euro the more important of the two currencies in every pair. /n/nThe rule is that whichever name comes first is the one that is getting stronger on higher numbers and weaker on lower numbers. Suppose the number goes up in the pound, for example, from 1.6000 to 1.6500. In that case, it means the pound is getting stronger, and by definition, the dollar is getting weaker because, in this pair, the full quote should read GBP/USD. It is accurate to express the quote as $1.6000 to $1.6500, meaning the pound used to cost $1.6000, but now it costs $1.6500. Journalists usually apply the convention of putting the dollar sign in front of the price quote, although brokers and analysts tend not to insert the currency symbol. /n/nThis is also true of the euro (EUR/USD), so a higher number always means the euro is getting stronger vis-à-vis the dollar. You could say the EUR/USD moved from 1.3200 to 1.3900, meaning it got more expensive in dollar terms. If you are new to Forex, you can place an imaginary currency symbol in front of the first-named currency to get your bearings. Therefore, the price quote now looks like $1.3200 to $1.3900. /n/nThe pound, euro, Australian dollar, and New Zealand dollar are the top key currencies in which the dollar does not come first because of historic convention. All other currencies are quoted in terms of dollars, such as USD/CHF = US dollar against the Swiss franc. /n/nBelow is the Bloomberg’s list of major currencies. Bloomberg is one of many market information providers in the professional and retail Forex market. Other providers, including brokers, have their own version of this list."))
}
