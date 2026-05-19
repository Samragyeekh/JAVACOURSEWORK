package com.lumiere.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Route mapping for the product detail pages
@WebServlet("/productdescription")
public class ProductDescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Data model for a single product item
    public static class ProductItem {
        private int id;
        private String name, image, alt, stars, volume, description;
        private String price;
        private String optionLabel;
        private String optionName1, optionName2, optionName3, optionName4;
        private String optionStyle1, optionStyle2, optionStyle3, optionStyle4;
        private String editorialQuote, useInstruction;
        private String fTitle1, fBody1, fTitle2, fBody2, fTitle3, fBody3;
        private String img1, img2, img3, img4, img5, img6, img7, img8;

        // Constructor to populate all product details, images, and variant swatches
        public ProductItem(int id, String name, String image, String alt, String stars, String price, String volume, String description,
                           String optionLabel,
                           String optionName1, String optionName2, String optionName3, String optionName4,
                           String optionStyle1, String optionStyle2, String optionStyle3, String optionStyle4,
                           String editorialQuote, String useInstruction,
                           String fTitle1, String fBody1, String fTitle2, String fBody2, String fTitle3, String fBody3,
                           String img1, String img2, String img3, String img4, String img5, String img6, String img7, String img8) {
            this.id = id; this.name = name; this.image = image; this.alt = alt;
            this.stars = stars; this.price = price; this.volume = volume; this.description = description;
            this.optionLabel = optionLabel;
            this.optionName1 = optionName1; this.optionName2 = optionName2; this.optionName3 = optionName3; this.optionName4 = optionName4;
            this.optionStyle1 = optionStyle1; this.optionStyle2 = optionStyle2; this.optionStyle3 = optionStyle3; this.optionStyle4 = optionStyle4;
            this.editorialQuote = editorialQuote; this.useInstruction = useInstruction;
            this.fTitle1 = fTitle1; this.fBody1 = fBody1;
            this.fTitle2 = fTitle2; this.fBody2 = fBody2;
            this.fTitle3 = fTitle3; this.fBody3 = fBody3;
            this.img1 = img1; this.img2 = img2; this.img3 = img3; this.img4 = img4;
            this.img5 = img5; this.img6 = img6; this.img7 = img7; this.img8 = img8;
        }

        // Getters needed so JSP Expression Language can display fields on the frontend
        public int getId() { return id; }
        public String getName() { return name; }
        public String getImage() { return image; }
        public String getAlt() { return alt; }
        public String getStars() { return stars; }
        public String getPrice() { return price; }
        public String getVolume() { return volume; }
        public String getDescription() { return description; }
        public String getOptionLabel() { return optionLabel; }
        public String getOptionName1() { return optionName1; }
        public String getOptionName2() { return optionName2; }
        public String getOptionName3() { return optionName3; }
        public String getOptionName4() { return optionName4; }
        public String getOptionStyle1() { return optionStyle1; }
        public String getOptionStyle2() { return optionStyle2; }
        public String getOptionStyle3() { return optionStyle3; }
        public String getOptionStyle4() { return optionStyle4; }
        public String getEditorialQuote() { return editorialQuote; }
        public String getUseInstruction() { return useInstruction; }
        public String getfTitle1() { return fTitle1; }
        public String getfBody1() { return fBody1; }
        public String getfTitle2() { return fTitle2; }
        public String getfBody2() { return fBody2; }
        public String getfTitle3() { return fTitle3; }
        public String getfBody3() { return fBody3; }
        public String getImg1() { return img1; }
        public String getImg2() { return img2; }
        public String getImg3() { return img3; }
        public String getImg4() { return img4; }
        public String getImg5() { return img5; }
        public String getImg6() { return img6; }
        public String getImg7() { return img7; }
        public String getImg8() { return img8; }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Temporary hardcoded catalog list (acting as a mock database table)
        List<ProductItem> allItems = new ArrayList<>();

        allItems.add(new ProductItem(1, "Rose Blush", "images/blush.png", "Rose Blush", "★★★★☆", "Rs. 1,200", "0.15 oz",
            "A lightweight liquid formula that blends effortlessly for a healthy, natural looking flush of color on your skin. Built with micro-milled mineral pigments to avoid clotting.",
            "shade", "cool pink taffy", "soft nude apricot", "velvet ruby crimson", "deep chestnut cocoa", "#e6ccb2", "#ddb892", "#b08968", "#9c6644",
            "A PERFECTLY BUILDABLE FLUSH THAT LASTS ALL DAY WITHOUT DRYING.", "Dab three small dots directly onto the apples of your cheeks. Use your fingertips or a dense blending brush to sweep upward toward the temples for an instant lifting effect.",
            "seamless melting blend", "Infused with micronized pigments that disappear into the skin structure.", "8-hour continuous radiance", "Maintains a freshly applied dewy glow without turning patchy or oily.", "skin-loving hydration complex", "Enriched with real botanical extracts to keep cheek areas smooth and plump.",
            "images/blush.png", "images/blush1.png", "images/blush2.png", "images/blush3.png", "images/blush4.png", "images/blush5.png", "images/blush6.png", "images/blush7.png"));

        allItems.add(new ProductItem(2, "Glow Serum", "images/Serum.png", "Glow Serum", "★★★★★", "Rs. 2,500", "1.01 oz",
            "Formulated to instantly quench skin surface layer tissues. Delivers intense 24-hour hydration while adding an effortless dewy luster to your cheekbones.",
            "skin type", "dry skin rescue", "oily balance blend", "sensitive skin shield", "combination therapy", "#f0fdf4", "#e0f2fe", "#fffbeb", "#fdf2f8",
            "THE REFRESHING LIQUID HYDRATION GLOW MY TIRED SKIN WAS CRAVING.", "Smooth two to three drops over clean, damp skin morning and night. Press gently into the face and neck surfaces until absorbed before sealing with your daily cream.",
            "24-hour deep hydration", "Quenches thirsty dermal layers instantly for long-lasting relief.", "instant dewy luster", "Creates a smooth, reflective glassy finish on high facial planes.", "barrier defense matrix", "Strengthens your skin's outer defensive moisture layer against dust.",
            "images/Serum.png", "images/serum1.png", "images/serum2.png", "images/serum3.png", "images/serum4.png", "images/serum5.png", "images/serum6.png", "images/serum7.png"));

        allItems.add(new ProductItem(3, "Matte Lipstick", "images/lipstick.png", "Matte Lipstick", "★★★☆☆", "Rs. 850", "0.12 oz",
            "A smooth, non-drying matte formulation that sets quickly without settling into fine lip lines. Offers long-lasting hydration and comfortable daily wear.",
            "shade", "classic crimson red", "blushing rose pink", "muted berry mauve", "warm chestnut nude", "#b7094c", "#e07a5f", "#a01a58", "#cd9a62",
            "MY ULTIMATE GO-TO FOR AN INTENSE COMFORTABLE MATTE STATEMENT LOOK.", "Glide the bullet directly onto lips, starting from the center cupid's bow and working outward. Layer twice to lock down full-coverage pigmentation intensity.",
            "velvet cushion comfort", "Glides like a cream but sets into a weightless, breathable matte veil.", "12-hour transfer resistance", "Smudge-proof engineering that stays inside lines through coffee and meals.", "zero cakey flaking", "Formulated with deep seed oils to prevent dry, tight peeling sensations.",
            "images/lipstick.png", "images/lipstick1.png", "images/lipstick2.png", "images/lipstick3.png", "images/lipstick4.png", "images/lipstick5.png", "images/lipstick6.png", "images/lipstick7.png"));

        allItems.add(new ProductItem(4, "Moisturiser SPF", "images/moisturizer.png", "Moisturiser SPF", "★★★★☆", "Rs. 1,800", "1.70 oz",
            "A fast-absorbing cream designed to defend skin cells against radiation damage while providing vital essential lipid moisture matrix benefits.",
            "density", "featherweight gel", "classic whipped cream", "intense rich balm", "oil-free fluid", "#ffffff", "#f5f5f5", "#e5e5e5", "#d4d4d4",
            "COMPLETE PROTECTION LAYER THAT FEELS INVISIBLE AND SILKY UNDER MAKEUP.", "Apply generously as the final step of your skincare routine every morning. Reapply every two hours if working outdoors under direct sunlight exposure.",
            "broad spectrum shield", "Blocks harmful environmental rays cleanly without any chalky white cast residue.", "makeup primer finish", "Smoothes out skin texture pores so cosmetics slide on beautifully.", "urban pollution blocker", "Forms an invisible protective shield against airborne dust particles.",
            "images/moisturizer.png", "images/moisturizer1.png", "images/moisturizer2.png", "images/moisturizer3.png", "images/moisturizer4.png", "images/moisturizer5.png", "images/moisturizer6.png", "images/moisturizer7.png"));

        allItems.add(new ProductItem(5, "Eyeshadow Palette", "images/eyeshadow.png", "Eyeshadow Palette", "★★★★★", "Rs. 3,200", "0.45 oz",
            "Contains foundational luxury neutral tones optimized for all skin tones. Features high-payoff velvet matte and shimmery reflective pressed shadow pans.",
            "palette", "neutral sands", "sunset rose blush", "golden olive ore", "smoky midnight quartz", "#e6ccb2", "#e07a5f", "#cd9a62", "#4a4e69",
            "AN EXPRESSIVE RANGE OF BOLD VEIL SHADES MIXING WARM GLOW ACCENTS.", "Dust shimmer pans along internal tear duct points. Blend velvet mattes straight through crease parameters to construct premium visual depth shadows.",
            "pure powder payoff", "Rich color loads that adhere cleanly across eye surface areas.", "crease free setting", "Resists settling into facial skin folds for up to 14 hours.", "dual utility application", "Optimized for wet metallic damp layering or soft daily dry blends.",
            "images/eyeshadow.png", "images/eyeshadow1.png", "images/eyeshadow2.png", "images/eyeshadow3.png", "images/eyeshadow4.png", "images/eyeshadow5.png", "images/eyeshadow6.png", "images/eyeshadow7.png"));

        allItems.add(new ProductItem(6, "Face Toner", "images/toner.png", "Face Toner", "★★★★☆", "Rs. 950", "5.00 oz",
            "Removes stubborn excess oils and trace impurities while balancing pH values. Enriched with skin-soothing botanical extracts.",
            "format", "refreshing liquid mist", "matte control splash", "hydrating toner treatment", "calming herbal essence", "#ecfeff", "#f0fdf4", "#fffbeb", "#fff1f2",
            "AN INSTANT BURST OF REFRESHING HARMONY REBALANCING MY SKIN VALUES.", "Saturate a soft organic cotton pad and sweep gently across the face, or mist directly onto skin layers from six inches away for a splash of midday cooling hydration.",
            "pore refining clarity", "Sweeps away dead skin blockages to visibly tighten pore dimensions.", "optimal pH balance", "Restores the skin's healthy natural moisture balance instantly.", "botanical redness relief", "Infused with soothing floral distillates to calm raw skin surface zones.",
            "images/toner.png", "images/toner1.png", "images/toner2.png", "images/toner3.png", "images/toner4.png", "images/toner5.png", "images/toner6.png", "images/toner7.png"));

        allItems.add(new ProductItem(7, "Lip Gloss", "images/lipgloss.png", "Lip Gloss", "★★★★☆", "Rs. 650", "0.16 oz",
            "A high-shine finish that delivers a cushiony, comfortable feel without any sticky residue. Leaves a hint of buildable custom tint.",
            "finish", "crystal clear glaze", "shimmery pink pearl", "sparkling bronze sugar", "sheer cherry shine", "#ffffff", "#fbcfe8", "#fde047", "#f43f5e",
            "THE ULTIMATE NON-STICKY GLASS REFLECTION THAT PLUMPS BEAUTIFULLY.", "Apply directly over your bare lips for a wet, high-shine glaze, or layer as a top coat over your favorite matte lipstick to instantly add dimensional plumpness.",
            "mirror shine reflection", "Provides an intense glassy glow that catches the light from every angle.", "zero sticky residue", "Formulated with dynamic cushion polymer arrays to ensure lips stay totally weightless.", "volumizing infusion", "Gently conditions dry contours to fill out fine vertical lines.",
            "images/lipgloss.png", "images/lipgloss1.png", "images/lipgloss2.png", "images/lipgloss3.png", "images/lipgloss4.png", "images/lipgloss5.png", "images/lipgloss6.png", "images/lipgloss7.png"));

        allItems.add(new ProductItem(8, "Night Cream", "images/nightcream.png", "Night Cream", "★★★★★", "Rs. 2,100", "1.69 oz",
            "Works throughout your nightly rest phase to revitalize tired surface cells. Formulated with rich botanical moisturizers.",
            "formula", "deep moisture velvet", "anti-fatigue fluid", "firming barrier lipid", "calming overnight mask", "#fed7aa", "#ffedd5", "#fffff0", "#f0fdf4",
            "AN INTENSE OVERNIGHT BLEND THAT REPAIRS SKIN STRESS WHILE YOU SLEEP.", "Massage a dime-sized amount into your face and neck skin after your night serums. Press upward in circular paths to boost absorption and micro-circulation.",
            "overnight cell recovery", "Speeds up skin renewal to clear dry textures and stress lines by morning.", "deep lipid sealing", "Creates a breathable moisture lock that stops water loss throughout the night.", "botanical calming bases", "Infused with night flower extracts to soothe skin redness.",
            "images/nightcream.png", "images/nightcream1.png", "images/nightcream2.png", "images/nightcream3.png", "images/nightcream4.png", "images/nightcream5.png", "images/nightcream6.png", "images/nightcream7.png"));

        allItems.add(new ProductItem(9, "Clay Mask", "images/claymask.png", "Clay Mask", "★★★★☆", "Rs. 1,400", "2.00 oz",
            "Deeply detoxifies skin layers by pulling impurities from deep within pores while introducing vital earth minerals.",
            "skin goal", "pore suction detox", "brightening oil control", "soothing skin renewal", "blemish control wash", "#f2f2f2", "#e6f4ea", "#fce8e6", "#fef7e0",
            "A REFRESHING PORE PURGE ENGINED TO LEAVE SKIN CLEAN AND BALANCED.", "Apply an even layer over clean skin, avoiding eye contours. Leave on for 10 minutes until dry, then rinse with warm water in gentle circular sweeping motions.",
            "deep pore extractions", "Magnetically pulls out stubborn cellular plugs and toxic environmental buildup.", "mineral rich hydration", "Infuses standard volcanic clay minerals to soften raw skin scales.", "oil production tuning", "Calms sebaceous gland overactivity to stop midday facial grease.",
            "images/claymask.png", "images/claymask1.png", "images/claymask2.png", "images/claymask3.png", "images/claymask4.png", "images/claymask5.png", "images/claymask6.png", "images/claymask7.png"));

        allItems.add(new ProductItem(10, "Cleansing Balm", "images/balm.png", "Cleansing Balm", "★★★★★", "Rs. 1,950", "3.20 oz",
            "Melts away long-wear face pigments, sunscreen, and stubborn oils instantly without stripping skin protective layers.",
            "texture", "melting sorbet oil", "nourishing milk splash", "deep pore clearing fluid", "sensitive skin glaze", "#fef08a", "#bbf7d0", "#bfdbfe", "#fbcfe8",
            "MELTS HEAVY COSMETICS LIKE BUTTER WHILE KEEPING SKIN COMPLETELY SOFT.", "Scoop a small amount and massage over dry skin to instantly break down waxes and face makeups. Splash with warm water to emulsify into milk, then rinse.",
            "complete makeup melt", "Liquefies stubborn water-resistant cosmetics, liners, and mascaras in seconds.", "milky rinsing emulsion", "Transforms instantly with water to rinse away cleanly without leaving oily films.", "barrier protective wash", "Maintains natural skin lipid levels so the face never feels dry or tight.",
            "images/balm.png", "images/balm1.png", "images/balm2.png", "images/balm3.png", "images/balm4.png", "images/balm5.png", "images/balm6.png", "images/balm7.png"));

        allItems.add(new ProductItem(11, "Setting Powder", "images/powder.png", "Setting Powder", "★★★★☆", "Rs. 1,100", "0.70 oz",
            "Locks makeup layout for up to 16 hours. Blurs the appearance of pores and textures with a translucent matte finish.",
            "tone", "translucent bright", "warm banana bake", "deep honey balance", "fair porcelain glow", "#ffffff", "#fef08a", "#ca8a04", "#faf5ff",
            "AN INVISIBLE MATTE BLUR BLOCK THAT LOCKS MAKEUP FLUSH FOR 16 HOURS.", "Press a velvet powder puff into the mesh screen, tap off excess dust, and press firmly into oily facial zones like the T-zone and under-eyes to bake.",
            "16-hour makeup lock", "Prevents cosmetic fading, running, or settling into fine skin folds.", "airbrush blurring effect", "Utilizes light-refracting particles to blur large pore dimensions visually.", "zero flash back bounce", "Engineered to reject white flashback glare during photography.",
            "images/powder.png", "images/powder1.png", "images/powder2.png", "images/powder3.png", "images/powder4.png", "images/powder5.png", "images/powder6.png", "images/powder7.png"));

        allItems.add(new ProductItem(12, "Eyeliner Pen", "images/eyeliner.png", "Eyeliner Pen", "★★★☆☆", "Rs. 750", "0.03 oz",
            "Ultra-precise tip structure designed to deliver saturated midnight carbon pigmentation with crisp wing control.",
            "finish", "matte carbon black", "metallic deep bronze", "satin midnight navy", "rich espresso brown", "#000000", "#78350f", "#1e3a8a", "#451a03",
            "THE SHARPEST WING CONTROL SYSTEM THAT ABSOLUTELY REFUSES TO SMUDGE.", "Place the precision brush tip flat against your lash line and glide outward. Flick upward at the outer corner toward the eyebrow tail for a sharp wing look.",
            "0.1mm precision line", "Ultra-fine flexible brush tip provides total control over thickness.", "waterproof smudge shield", "Resists sweat, humidity, and tears without running or flaking.", "continuous ink flow", "Capillary ink feed system ensures a smooth line with every stroke.",
            "images/eyeliner.png", "images/eyeliner1.png", "images/eyeliner2.png", "images/eyeliner3.png", "images/eyeliner4.png", "images/eyeliner5.png", "images/eyeliner6.png", "images/eyeliner7.png"));

        allItems.add(new ProductItem(13, "Body Lotion", "images/lotion.png", "Body Lotion", "★★★★☆", "Rs. 1,250", "8.00 oz",
                "A rich, fast-absorbing body cream that restores dry skin, leaving a silky touch and a soft, warm vanilla bean scent.",
                "scent", "warm vanilla bean", "fresh coastal coconut", "soothing lavender milk", "citrus blossom zest", "#fef3c7", "#ecfdf5", "#f5f3ff", "#fff7ed",
                "DEEP ALL-OVER HYDRATION THAT ABSORBS INSTANTLY WITHOUT ANY GREASY FILM.", "Apply generously over your entire body daily, focusing on especially dry areas like elbows, knees, and heels right after showering to lock in skin moisture.",
                "48-hour moisture barrier", "Provides continuous hydration to soothe tight, flaky skin all day.", "fast absorption system", "Sinks into skin layers within seconds so you can get dressed immediately.", "skin smoothing lipids", "Formulated with plant butters to restore natural skin suppleness.",
                "images/lotion.png", "images/lotion1.png", "images/lotion2.png", "images/lotion3.png", "images/lotion4.png", "images/lotion5.png", "images/lotion6.png", "images/lotion7.png"));

        allItems.add(new ProductItem(14, "Face Scrub", "images/scrub.png", "Face Scrub", "★★★★☆", "Rs. 900", "2.50 oz",
                "Gently polishes away dead cells using ultra-fine bamboo particles to reveal glowing skin texture underneath.",
                "intensity", "soft polishing grain", "medium pore clearance", "deep smoothing resurface", "ultra-gentle enzyme", "#fff7ed", "#ffedd5", "#fed7aa", "#fffff0",
                "SWEEPS AWAY DULL FLAKES INSTANTLY FOR AN ULTRA-SMOOTH, GLOWING FACE.", "Massage a small amount onto damp skin using gentle circular paths for one minute, then rinse thoroughly with warm water. Use twice a week.",
                "natural bamboo grains", "Polishes uneven texturing without causing micro-tears in skin tissue.", "instant brightening", "Removes dead cell buildup to immediately let natural skin radiance through.", "pore texturing clearance", "Helps clear out blackheads and congestion around the nose and chin areas.",
                "images/scrub.png", "images/scrub1.png", "images/scrub2.png", "images/scrub3.png", "images/scrub4.png", "images/scrub5.png", "images/scrub6.png", "images/scrub7.png"));

         allItems.add(new ProductItem(15, "Sunscreen Gel", "images/sunscreen.png", "Sunscreen Gel", "★★★★★", "Rs. 2200", "1.70 oz",
                "A weightless, water-based SPF 50 gel that leaves an invisible matte finish while defending skin from sun rays.",
                "finish", "invisible satin matte", "dewy hydration glow", "tinted skin corrector", "oil-free clear shield", "#f8fafc", "#f0fdf4", "#fef3c7", "#ecfeff",
                "THE MOST INVISIBLE SUNSCREEN YOU WILL EVER WEAR. ZERO WHITE CAST.", "Apply evenly over your face and neck as the final step of your morning skincare routine, 15 minutes before sun exposure.",
                "broad spectrum SPF 50", "Provides maximum protection against aging UVA and burning UVB rays.", "water-light gel texture", "Feels like a splash of water and dries down completely invisible.", "zero greasy shine", "Controls sebum production to keep your face fresh and matte in hot weather.",
                "images/sunscreen.png", "images/sunscreen1.png", "images/sunscreen2.png", "images/sunscreen3.png", "images/sunscreen4.png", "images/sunscreen5.png", "images/sunscreen6.png", "images/sunscreen7.png"));

          allItems.add(new ProductItem(16, "Mascara Vol", "images/mascara.png", "Mascara Vol", "★★★★☆", "Rs. 990", "0.30 oz",
                "Builds dramatic volume and length with a hourglass brush that coats every single lash without clumping.",
                "color", "midnight carbon black", "deep espresso brown", "electric royal blue", "clear lash lifter", "#000000", "#451a03", "#1e3a8a", "#f8fafc",
                "INSTANT LASH EXTENSION EFFECT WITH OUTSTANDING VOLUME AND ZERO CLUMPS.", "Place the hourglass brush at the base of your lashes and wiggle it side to side as you sweep upward to the tips. Layer for extra drama.",
                "hourglass fiber brush", "Coats even the tiniest corner lashes for an open, wide-eyed look.", "smudge-proof lock", "Stays put through sweat and humidity without flaking under eyes.", "lash conditioning oils", "Infused with plant waxes to keep lash hairs soft and flexible, never stiff.",
                "images/mascara.png", "images/mascara1.png", "images/mascara2.png", "images/mascara3.png", "images/mascara4.png", "images/mascara5.png", "images/mascara6.png", "images/mascara7.png"));

           allItems.add(new ProductItem(17, "Lip Tint", "images/liptint.png", "Lip Tint", "★★★★☆", "Rs. 800", "0.10 oz",
                "A water-light lip stain that leaves a natural splash of kiss-proof color that stays vibrant all day.",
                "shade", "fresh cherry pop", "sweet strawberry flush", "warm peach glaze", "juicy berry syrup", "#dc2626", "#f43f5e", "#f97316", "#9d174d",
                "A NATURAL WATER-LIGHT STAIN THAT STAYS FRESH THROUGH MEALS AND KISSES.", "Swipe once onto the center of your lips and blend outward with your finger for a soft gradient effect, or apply full lips for bold color.",
                "12-hour stain lock", "Sinks into lips so the color won't rub off on cups or clothes.", "weightless water base", "Feels completely bare on lips while delivering bright pigmentation.", "hydration splash", "Formulated with glycerin to keep your lip stain looking fresh and smooth.",
                "images/liptint.png", "images/liptint1.png", "images/liptint2.png", "images/liptint3.png", "images/liptint4.png", "images/liptint5.png", "images/liptint6.png", "images/liptint7.png"));

            allItems.add(new ProductItem(18, "Face Oil", "images/faceoil.png", "Face Oil", "★★★★★", "Rs. 2,800", "1.00 oz",
                "A luxury blend of botanical seed oils that deeply nourishes dry skin cells to restore a glowing complexion overnight.",
                "blend", "luxury radiant rose", "calming blue tansy", "balancing golden jojoba", "intense avocado repair", "#fff1f2", "#eff6ff", "#fef9c3", "#f0fdf4",
                "A LIQUID GOLD REPAIR BLEND THAT TRANSFORMS DRY, TIRED SKIN OVERNIGHT.", "Warm two drops between your palms and gently press onto your cheeks, forehead, and neck as the final step of your nighttime skincare routine.",
                "luxury seed selection", "Blends organic oils to feed skin cells essential protective fatty acids.", "instant radiant glow", "Brings dry skin back to life with a healthy, youthful luster.", "deep moisture sealing", "Locks in underlying serums so you wake up with soft, plump skin.",
                "images/faceoil.png", "images/faceoil1.png", "images/faceoil2.png", "images/faceoil3.png", "images/faceoil4.png", "images/faceoil5.png", "images/faceoil6.png", "images/faceoil7.png"));

            allItems.add(new ProductItem(19, "Concealer", "images/concealer.png", "Concealer", "★★★★☆", "Rs. 1,350", "0.20 oz",
                "A creamy, full-coverage liquid concealer that hides dark circles and blemishes seamlessly with a satin finish.",
                "shade", "fair porcelain balance", "light vanilla cream", "medium honey sand", "deep caramel spice", "#fffaf5", "#fdf4e3", "#f5e6cc", "#dfba89",
                "CREAMY FULL COVERAGE THAT ERASES DARK CIRCLES WITHOUT CREASING.", "Dot directly under eyes, over blemishes, or around the nose. Blend gently with a damp beauty sponge or concealer brush.",
                "full coverage finish", "Instantly erases dark under-eye shadows and redness in one swipe.", "flexible stretch base", "Moves naturally with your skin expression so it never creases or cakes.", "brightening botanical mix", "Infused with caffeine to visibly de-puff eye contours while wearing.",
                "images/concealer.png", "images/concealer1.png", "images/concealer2.png", "images/concealer3.png", "images/concealer4.png", "images/concealer5.png", "images/concealer6.png", "images/concealer7.png"));

            allItems.add(new ProductItem(20, "Setting Spray", "images/spray.png", "Setting Spray", "★★★★☆", "Rs. 1,600", "3.40 oz",
                "A micro-fine mist that locks your makeup layout in place for up to 16 hours with a radiant, skin-like finish.",
                "finish", "dewy hydration glow", "matte oil controller", "satin longwear lock", "glowing micro shimmer", "#fdf2f8", "#ecfdf5", "#f8fafc", "#fffbeb",
                "LOCKS MAKEUP FOR 16 HOURS WITH A REFRESHING, SKIN-LIKE FINISH.", "Hold the bottle 8 inches away from your face, close your eyes, and mist evenly in an 'X' and 'T' pattern across your face after makeup application.",
                "16-hour layout seal", "Stops makeup from melting, shifting, or fading through long days.", "micro-fine mist pump", "Delivers an even cloud of protection without leaving wet droplets.", "instant refreshing reset", "Melts powder steps into the skin for a seamless, natural look.",
                "images/spray.png", "images/spray1.png", "images/spray2.png", "images/spray3.png", "images/spray4.png", "images/spray5.png", "images/spray6.png", "images/spray7.png"));

            allItems.add(new ProductItem(21, "Lip Liner", "images/lipliner.png", "Lip Liner", "★★★☆☆", "Rs. 550", "0.04 oz",
                "A creamy, wooden lip pencil that defines lips smoothly and stops lipstick from bleeding past lip lines.",
                "shade", "dusty rose nude", "classic velvet red", "warm spice mocha", "soft mauve petal", "#cd857f", "#990011", "#6e473b", "#b07d8a",
                "DEFINES LIPS WITH RICH, CREAMY COLOR THAT KEEPS LIPSTICK IN PLACE.", "Outline your natural lip line starting from the cupid's bow. Fill in lips entirely to create a long-lasting base for your lipstick.",
                "creamy glide formula", "Shapes contours smoothly without tugging or skipping on lip tissue.", "lipstick bleeding barrier", "Forms a crisp barrier that stops glosses and lipsticks from smudging.", "rich pigmentation", "Delivers full color payoff that can be worn alone as a matte lip.",
                "images/lipliner.png", "images/lipliner1.png", "images/lipliner2.png", "images/lipliner3.png", "images/lipliner4.png", "images/lipliner5.png", "images/lipliner6.png", "images/lipliner7.png"));

            allItems.add(new ProductItem(22, "Eye Cream", "images/eyecream.png", "Eye Cream", "★★★★☆", "Rs. 1,850", "0.50 oz",
                "A rich, comforting cream that visibly de-puffs tired under-eyes and hydrates delicate contours.",
                "target", "dark circle relief", "de-puffing caffeine", "fine line smoothing", "intense hydration rich", "#fdf4ff", "#ecfeff", "#fefaf0", "#fff1f2",
                "DE-PUFFS AND BRIGHTENS TIRED EYES FOR A FRESH, REFRESHED LOOK.", "Gently pat a pea-sized amount around your entire eye area using your ring finger, moving from the inner corners outward.",
                "active de-puffing brush", "Visibly reduces morning under-eye bags and swelling within minutes.", "vascular dark circle clearing", "Helps clear away pooled shadows to brighten skin tones.", "delicate contour shield", "Plumps skin with hydration to smooth fine expression dry lines.",
                "images/eyecream.png", "images/eyecream1.png", "images/eyecream2.png", "images/eyecream3.png", "images/eyecream4.png", "images/eyecream5.png", "images/eyecream6.png", "images/eyecream7.png"));

            allItems.add(new ProductItem(23, "Sheet Mask", "images/sheetmask.png", "Sheet Mask", "★★★★★", "Rs. 350", "0.70 oz",
                "An organic cotton sheet mask soaked in hydrating serum to deliver a concentrated blast of moisture in 15 minutes.",
                "type", "hyaluronic moisture", "brightening vitamin C", "soothing tea tree", "collagen firming lift", "#e0f2fe", "#fef3c7", "#f0fdf4", "#fae8ff",
                "A 15-MINUTE SPA TREATMENT THAT FLOODS SKIN WITH REFRESHING SERUM.", "Unfold the mask and press it evenly onto clean skin. Leave on for 15 minutes, peel off, and pat the remaining serum into your face.",
                "concentrated serum flood", "Drenches dry skin cells in a high-dose pool of hydrating nutrients.", "100% organic cotton cloth", "Clings perfectly to facial curves to maximize serum absorption.", "instant skin reset", "Transforms rough, dry textures into soft, bouncy skin in one use.",
                "images/sheetmask.png", "images/sheetmask1.png", "images/sheetmask2.png", "images/sheetmask3.png", "images/sheetmask4.png", "images/sheetmask5.png", "images/sheetmask6.png", "images/sheetmask7.png"));

            allItems.add(new ProductItem(24, "Primer Base", "images/primer.png", "Primer Base", "★★★★☆", "Rs. 1,700", "1.00 oz",
                "A weightless, gel-cream primer that blurs large pores and controls shiny facial oils for a smooth makeup canvas.",
                "skin target", "pore blurring matte", "glowing hydration radiance", "redness color corrector", "oil-free grip base", "#f8fafc", "#fffbeb", "#f0fdf4", "#eff6ff",
                "CREATES A FLAWLESS, PORELESS CANVAS THAT KEEPS MAKEUP FRESH ALL DAY.", "Smooth a pea-sized amount over your face using your fingers before applying foundation, focusing on your nose, chin, and forehead.",
                "pore blurring filter", "Visibly fills and smoothes out large pores for a silky canvas texture.", "makeup grip engineering", "Binds to your foundation layout to prevent sliding or fading.", "oil control complex", "Keeps surface shine at bay without drying out your skin underneath.",
                "images/primer.png", "images/primer1.png", "images/primer2.png", "images/primer3.png", "images/primer4.png", "images/primer5.png", "images/primer6.png", "images/primer7.png"));

            // Default item selection index on fresh entry routing
            int targetId = 1;
            String idParam = request.getParameter("id");
            
            // Parse the incoming 'id' string parameter safely
            if (idParam != null && !idParam.trim().isEmpty()) {
                try {
                    targetId = Integer.parseInt(idParam);
                } catch (NumberFormatException e) {
                    targetId = 1; // Fallback to item 1 if parsing throws an error
                }
            }

            // Loop through everything to find the matching item
            ProductItem selectedProduct = null;
            for (ProductItem item : allItems) {
                if (item.getId() == targetId) {
                    selectedProduct = item;
                    break;
                }
            }
            
            // Safety guard if the requested id does not exist in the collection
            if (selectedProduct == null) {
                selectedProduct = allItems.get(0);
            }

            // Build recommendations list excluding the active product item up to 4 items max
            List<ProductItem> availableRecs = new ArrayList<>();
            for (ProductItem item : allItems) {
                if (item.getId() != selectedProduct.getId() && availableRecs.size() < 4) {
                    availableRecs.add(item);
                }
            }

            // Pass objects downstream into the request attributes container context
            request.setAttribute("product", selectedProduct);
            request.setAttribute("recommendations", availableRecs);
            
            // Forward tracking flow to the page layout jsp
            request.getRequestDispatcher("/WEB-INF/pages/productdescription.jsp").forward(request, response);
        }

        // Pass POST submissions back into doGet method seamlessly
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            doGet(request, response);
        }
    }
