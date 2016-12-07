package kr.co.bitcamp.common.util;


import java.io.File;
import java.io.IOException;
import org.apache.sanselan.ImageReadException;
import org.apache.sanselan.Sanselan;
import org.apache.sanselan.common.IImageMetadata;
import org.apache.sanselan.formats.jpeg.JpegImageMetadata;
import org.apache.sanselan.formats.tiff.TiffField;
import org.apache.sanselan.formats.tiff.TiffImageMetadata;
import org.apache.sanselan.formats.tiff.constants.TiffTagConstants;
import org.apache.sanselan.formats.tiff.constants.TagInfo;

public class MetadataExample {
    
   String date;
   double longitude;
   double latitude; 
   
   
   public String getDate() {
    return date;
   }

    public double getLongitude() {
        return longitude;
    }

    public double getLatitude() {
        return latitude;
    }

public void metadataExample(final File file) throws ImageReadException,
        IOException {
    // get all metadata stored in EXIF format (ie. from JPEG or TIFF).
    final IImageMetadata metadata =  Sanselan.getMetadata(file);


    // System.out.println(metadata);

    if (metadata instanceof JpegImageMetadata) {
        final JpegImageMetadata jpegMetadata = (JpegImageMetadata) metadata;

        System.out.println("file: " + file.getPath());
        date =jpegMetadata.getItems().get(10).toString();
        printTagValue(jpegMetadata, TiffTagConstants.TIFF_TAG_DATE_TIME);


        System.out.println();

        final TiffImageMetadata exifMetadata = jpegMetadata.getExif();
        if (null != exifMetadata) {
            final TiffImageMetadata.GPSInfo gpsInfo = exifMetadata.getGPS();
            if (null != gpsInfo) {

                longitude = gpsInfo.getLongitudeAsDegreesEast();
                latitude = gpsInfo.getLatitudeAsDegreesNorth();
                System.out.println("    "
                        + "GPS Longitude (Degrees East): " + longitude);
                System.out.println("    "
                        + "GPS Latitude (Degrees North): " + latitude);
            }
        }

    }
  }

  private static void printTagValue(final JpegImageMetadata jpegMetadata,
          final TagInfo tagInfo) {
      final TiffField field = jpegMetadata.findEXIFValueWithExactMatch(tagInfo);
      if (field == null) {
          System.out.println(tagInfo.name + ": " + "Not Found.");
      } else {
          System.out.println(tagInfo.name + ": "
                + field.getValueDescription());
      }
  }

}