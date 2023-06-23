import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreWidget extends StatelessWidget {
  final String? imageName;
  final String? storeName;
  final String? salePrice;
  final String? normalPrice;
  final String? isOnSale;
  const StoreWidget(
      {Key? key,
      this.normalPrice,
      this.storeName,
      this.imageName,
      this.isOnSale,
      this.salePrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 150,
      decoration: BoxDecoration(
        color: const Color(0xff2F3945),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageName!,
                height: 56,
                width: 56,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  storeName!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  isOnSale! == "1" ? '$salePrice€' : '$normalPrice€',
                  style: GoogleFonts.manrope(
                    color: const Color(0xffEBFF01),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (isOnSale! == "1") //too
                  Text(
                    '$normalPrice€',
                    style: GoogleFonts.manrope(
                      color: const Color(0xff6B7480),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: const Color(0xff6B7480),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
